import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../data/catalog.dart';
import '../domain/catalog_models.dart';
import '../widgets/common.dart';
import 'model_detail_screen.dart';

class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key, required this.language});

  final AppLanguage language;

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  final _searchController = TextEditingController();
  ModelKind? _selectedKind;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AiModel> get _results {
    final query = _searchController.text.trim().toLowerCase();
    return aiModels.where((model) {
      final kindMatches = _selectedKind == null || model.kind == _selectedKind;
      final haystack = [
        model.name,
        model.maker,
        model.tagline.en,
        model.tagline.ar,
        ...model.bestFor.expand((item) => [item.en, item.ar]),
      ].join(' ').toLowerCase();
      return kindMatches && (query.isEmpty || haystack.contains(query));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final language = widget.language;
    final results = _results;
    return CustomScrollView(
      key: const PageStorageKey('models-scroll'),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          sliver: SliverList.list(
            children: [
              PageIntro(
                eyebrow: const LocalizedText('Model atlas', 'أطلس النماذج'),
                title: const LocalizedText(
                  'Meet the minds behind AI.',
                  'تعرّف إلى العقول خلف الذكاء.',
                ),
                subtitle: const LocalizedText(
                  'Compare what each model does well, where it helps, and what you should never trust blindly.',
                  'قارن ما يتقنه كل نموذج وأين يفيد وما الذي لا يجب الوثوق به دون تحقق.',
                ),
                language: language,
              ),
              const SizedBox(height: 22),
              TextField(
                key: const ValueKey('model-search'),
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: LocalizedText(
                    'Search models, makers, or skills…',
                    'ابحث عن نموذج أو شركة أو مهارة…',
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
                        LocalizedText('All', 'الكل').resolve(language),
                      ),
                    ),
                    const SizedBox(width: 8),
                    for (final kind in ModelKind.values) ...[
                      FilterChip(
                        avatar: Icon(kind.icon, size: 16),
                        selected: _selectedKind == kind,
                        onSelected: (_) => setState(() => _selectedKind = kind),
                        label: Text(kind.label.resolve(language)),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SectionHeading(
                title: LocalizedText(
                  '${results.length} model families',
                  '${results.length} عائلة نماذج',
                ),
                language: language,
                trailing: const StatusPill(
                  label: 'CURATED',
                  color: AppColors.violet,
                  icon: Icons.verified_rounded,
                ),
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
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 36),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final columns = width >= 1050
                    ? 3
                    : width >= 620
                    ? 2
                    : 1;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 224,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _ModelCard(
                      model: results[index],
                      language: language,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Directionality(
                            textDirection: language.isArabic
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: ModelDetailScreen(
                              model: results[index],
                              language: language,
                            ),
                          ),
                        ),
                      ),
                    ),
                    childCount: results.length,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({
    required this.model,
    required this.language,
    required this.onTap,
  });

  final AiModel model;
  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      onTap: onTap,
      borderColor: model.accent.withValues(alpha: 0.28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: 'model-${model.id}',
                child: AccentIcon(icon: model.kind.icon, color: model.accent),
              ),
              const Spacer(),
              StatusPill(
                label: model.kind.label.resolve(language),
                color: model.accent,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            model.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 22),
          ),
          Text(
            model.maker,
            style: TextStyle(
              color: model.accent,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              model.tagline.resolve(language),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            children: [
              Text(
                LocalizedText('Open profile', 'افتح الملف').resolve(language),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Icon(
                language.isArabic
                    ? Icons.arrow_back_rounded
                    : Icons.arrow_forward_rounded,
                color: model.accent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
