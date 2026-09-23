import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../domain/catalog_models.dart';
import '../widgets/common.dart';

class ModelDetailScreen extends StatelessWidget {
  const ModelDetailScreen({
    super.key,
    required this.model,
    required this.language,
  });

  final AiModel model;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            backgroundColor: AppColors.ink,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                language.isArabic
                    ? Icons.arrow_forward_rounded
                    : Icons.arrow_back_rounded,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 18),
              title: Text(
                model.name,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              background: _DetailHeader(model: model, language: language),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            sliver: SliverList.list(
              children: [
                _SectionCard(
                  icon: Icons.badge_rounded,
                  color: model.accent,
                  title: const LocalizedText('Model profile', 'ملف النموذج'),
                  language: language,
                  child: Text(
                    model.summary.resolve(language),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 14),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth >= 700;
                    final benefits = _ListCard(
                      title: const LocalizedText('Why it helps', 'لماذا يفيد؟'),
                      icon: Icons.bolt_rounded,
                      color: AppColors.cyan,
                      items: model.benefits,
                      language: language,
                    );
                    final uses = _ListCard(
                      title: const LocalizedText(
                        'Best used for',
                        'أفضل استخداماته',
                      ),
                      icon: Icons.task_alt_rounded,
                      color: model.accent,
                      items: model.bestFor,
                      language: language,
                    );
                    if (!wide) {
                      return Column(
                        children: [benefits, const SizedBox(height: 14), uses],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: benefits),
                        const SizedBox(width: 14),
                        Expanded(child: uses),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 14),
                _ListCard(
                  title: const LocalizedText('Use with care', 'استخدمه بحذر'),
                  icon: Icons.warning_amber_rounded,
                  color: AppColors.coral,
                  items: model.avoid,
                  language: language,
                ),
                const SizedBox(height: 14),
                _SectionCard(
                  icon: Icons.key_rounded,
                  color: AppColors.gold,
                  title: const LocalizedText('Access', 'الوصول'),
                  language: language,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.access.resolve(language),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final platform in model.platforms)
                            StatusPill(
                              label: platform,
                              color: model.accent,
                              icon: Icons.open_in_new_rounded,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                AivoraCard(
                  borderColor: AppColors.violet.withValues(alpha: 0.45),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF35142F), Color(0xFF3B190E)],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AccentIcon(
                        icon: Icons.tips_and_updates_rounded,
                        color: AppColors.gold,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocalizedText(
                                'Prompt like a pro',
                                'اكتب طلباً احترافياً',
                              ).resolve(language),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              model.promptTip.resolve(language),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  LocalizedText(
                    'Plans, limits, and model names change. Confirm important details on the provider’s official site.',
                    'قد تتغير الخطط والحدود وأسماء النماذج. تحقق من التفاصيل المهمة في الموقع الرسمي للمزود.',
                  ).resolve(language),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.muted, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.model, required this.language});

  final AiModel model;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [model.accent.withValues(alpha: 0.3), AppColors.ink],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 62),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Hero(
          tag: 'model-${model.id}',
          child: AccentIcon(
            icon: model.kind.icon,
            color: model.accent,
            size: 74,
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.child,
    required this.language,
  });

  final IconData icon;
  final Color color;
  final LocalizedText title;
  final Widget child;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AccentIcon(icon: icon, color: color, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title.resolve(language),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
    required this.language,
  });

  final LocalizedText title;
  final IconData icon;
  final Color color;
  final List<LocalizedText> items;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      icon: icon,
      color: color,
      title: title,
      language: language,
      child: Column(
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.resolve(language),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
