import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../data/catalog.dart';
import '../domain/catalog_models.dart';
import '../widgets/common.dart';

class PlatformsScreen extends StatefulWidget {
  const PlatformsScreen({super.key, required this.language});

  final AppLanguage language;

  @override
  State<PlatformsScreen> createState() => _PlatformsScreenState();
}

class _PlatformsScreenState extends State<PlatformsScreen> {
  final _searchController = TextEditingController();
  PlatformKind? _selectedKind;
  bool _freeOnly = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AiPlatform> get _results {
    final query = _searchController.text.trim().toLowerCase();
    return aiPlatforms.where((platform) {
      final typeMatches =
          _selectedKind == null || platform.kind == _selectedKind;
      final priceMatches = !_freeOnly || platform.freeTier;
      final haystack = [
        platform.name,
        platform.company,
        platform.description.en,
        platform.description.ar,
        ...platform.models,
      ].join(' ').toLowerCase();
      return typeMatches &&
          priceMatches &&
          (query.isEmpty || haystack.contains(query));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final language = widget.language;
    final results = _results;
    return CustomScrollView(
      key: const PageStorageKey('platforms-scroll'),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          sliver: SliverList.list(
            children: [
              PageIntro(
                eyebrow: const LocalizedText('Platform finder', 'دليل المنصات'),
                title: const LocalizedText(
                  'Know where AI lives.',
                  'اعرف أين تجد الذكاء.',
                ),
                subtitle: const LocalizedText(
                  'Find the right app or developer platform, understand the cost model, and see what is available before you sign up.',
                  'ابحث عن التطبيق أو منصة التطوير المناسبة وافهم التكلفة وما هو متاح قبل التسجيل.',
                ),
                language: language,
              ),
              const SizedBox(height: 22),
              _LearningCard(language: language),
              const SizedBox(height: 18),
              TextField(
                key: const ValueKey('platform-search'),
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: LocalizedText(
                    'Search platforms or models…',
                    'ابحث عن منصة أو نموذج…',
                  ).resolve(language),
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterChip(
                      selected: _selectedKind == null,
                      onSelected: (_) => setState(() => _selectedKind = null),
                      label: Text(
                        LocalizedText(
                          'All types',
                          'كل الأنواع',
                        ).resolve(language),
                      ),
                    ),
                    const SizedBox(width: 8),
                    for (final kind in PlatformKind.values) ...[
                      FilterChip(
                        selected: _selectedKind == kind,
                        onSelected: (_) => setState(() => _selectedKind = kind),
                        label: Text(kind.label.resolve(language)),
                      ),
                      const SizedBox(width: 8),
                    ],
                    FilterChip(
                      avatar: const Icon(Icons.savings_rounded, size: 16),
                      selected: _freeOnly,
                      onSelected: (value) => setState(() => _freeOnly = value),
                      label: Text(
                        LocalizedText(
                          'Free entry',
                          'دخول مجاني',
                        ).resolve(language),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SectionHeading(
                title: LocalizedText(
                  '${results.length} platforms',
                  '${results.length} منصة',
                ),
                language: language,
              ),
            ],
          ),
        ),
        if (results.isEmpty)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 36),
            sliver: SliverToBoxAdapter(child: EmptyState(language: language)),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final columns = width >= 1000
                    ? 3
                    : width >= 620
                    ? 2
                    : 1;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 250,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _PlatformCard(
                      platform: results[index],
                      language: language,
                    ),
                    childCount: results.length,
                  ),
                );
              },
            ),
          ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          sliver: SliverToBoxAdapter(
            child: Text(
              LocalizedText(
                '“Free” usually has limits. Pricing and availability change—confirm on the official website before committing.',
                'تعني كلمة «مجاني» عادة وجود حدود. قد تتغير الأسعار والتوفر، لذلك تحقق من الموقع الرسمي قبل الالتزام.',
              ).resolve(language),
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.muted, fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
}

class _LearningCard extends StatelessWidget {
  const _LearningCard({required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      borderColor: AppColors.blue.withValues(alpha: 0.38),
      gradient: const LinearGradient(
        colors: [Color(0xFF2A153D), Color(0xFF3A180E)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AccentIcon(
                icon: Icons.account_tree_rounded,
                color: AppColors.blue,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  LocalizedText(
                    'AI, ML, model, platform—what is the difference?',
                    'ما الفرق بين AI وML والنموذج والمنصة؟',
                  ).resolve(language),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Definition(
                label: 'AI',
                text: LocalizedText('the broad field', 'المجال الواسع'),
                language: language,
              ),
              _Definition(
                label: 'ML',
                text: LocalizedText(
                  'how systems learn patterns',
                  'تعلم الأنماط من البيانات',
                ),
                language: language,
              ),
              _Definition(
                label: LocalizedText('Model', 'النموذج').resolve(language),
                text: LocalizedText('the trained engine', 'المحرك المدرّب'),
                language: language,
              ),
              _Definition(
                label: LocalizedText('Platform', 'المنصة').resolve(language),
                text: LocalizedText(
                  'where you use it',
                  'المكان الذي تستخدمه فيه',
                ),
                language: language,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Definition extends StatelessWidget {
  const _Definition({
    required this.label,
    required this.text,
    required this.language,
  });

  final String label;
  final LocalizedText text;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.ink.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label · ',
              style: const TextStyle(
                color: AppColors.snow,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: text.resolve(language),
              style: const TextStyle(color: AppColors.muted),
            ),
          ],
        ),
        style: const TextStyle(fontSize: 11),
      ),
    );
  }
}

class _PlatformCard extends StatelessWidget {
  const _PlatformCard({required this.platform, required this.language});

  final AiPlatform platform;
  final AppLanguage language;

  Future<void> _copyWebsite(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: 'https://${platform.website}'));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          LocalizedText('Website copied', 'تم نسخ الموقع').resolve(language),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      borderColor: platform.accent.withValues(alpha: 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AccentIcon(icon: Icons.apps_rounded, color: platform.accent),
              const Spacer(),
              StatusPill(
                label: platform.freeTier
                    ? LocalizedText(
                        'FREE ENTRY',
                        'دخول مجاني',
                      ).resolve(language)
                    : LocalizedText('PAID', 'مدفوع').resolve(language),
                color: platform.freeTier ? AppColors.cyan : AppColors.gold,
                icon: platform.freeTier
                    ? Icons.check_rounded
                    : Icons.workspace_premium_rounded,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(platform.name, style: Theme.of(context).textTheme.titleLarge),
          Text(
            platform.company,
            style: TextStyle(
              color: platform.accent,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              platform.description.resolve(language),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            platform.access.resolve(language),
            style: const TextStyle(
              color: AppColors.snow,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Expanded(
                child: Text(
                  platform.website,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.muted, fontSize: 12),
                ),
              ),
              IconButton(
                tooltip: LocalizedText(
                  'Copy website',
                  'نسخ الموقع',
                ).resolve(language),
                visualDensity: VisualDensity.compact,
                onPressed: () => _copyWebsite(context),
                icon: Icon(
                  Icons.copy_rounded,
                  size: 18,
                  color: platform.accent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
