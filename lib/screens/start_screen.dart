import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../data/catalog.dart';
import '../domain/catalog_models.dart';
import '../widgets/common.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.language,
    required this.onChooseGoal,
  });

  final AppLanguage language;
  final ValueChanged<int> onChooseGoal;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey('start-scroll'),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 36),
          sliver: SliverList.list(
            children: [
              PageIntro(
                eyebrow: const LocalizedText(
                  'Your AI compass',
                  'دليلك للذكاء الاصطناعي',
                ),
                title: const LocalizedText(
                  'What do you want to achieve?',
                  'ماذا تريد أن تنجز؟',
                ),
                subtitle: const LocalizedText(
                  'Skip the hype. Choose a goal and Aivora will guide you to the right model, platform, and prompt.',
                  'تجاوز الضجيج. اختر هدفاً وسيقودك Aivora إلى النموذج والمنصة والطلب المناسب.',
                ),
                language: language,
              ),
              const SizedBox(height: 24),
              _HeroPanel(language: language, onStart: () => onChooseGoal(3)),
              const SizedBox(height: 28),
              SectionHeading(
                title: const LocalizedText('Choose your path', 'اختر مسارك'),
                language: language,
              ),
              const SizedBox(height: 14),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 680 ? 2 : 1;
                  const gap = 12.0;
                  final width =
                      (constraints.maxWidth - (gap * (columns - 1))) / columns;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (final goal in userGoals)
                        SizedBox(
                          width: width,
                          child: _GoalCard(
                            goal: goal,
                            language: language,
                            onTap: () => onChooseGoal(goal.targetTab),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 28),
              _TrustStrip(language: language),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({required this.language, required this.onStart});

  final AppLanguage language;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      padding: EdgeInsets.zero,
      borderColor: AppColors.violet.withValues(alpha: 0.5),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF42180F), Color(0xFF28112F)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          children: [
            Positioned(
              right: -35,
              top: -45,
              child: Icon(
                Icons.blur_circular_rounded,
                size: 180,
                color: AppColors.cyan.withValues(alpha: 0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatusPill(
                    label: 'OFFLINE • PRIVATE',
                    color: AppColors.cyan,
                    icon: Icons.lock_rounded,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    LocalizedText(
                      'Turn a messy problem into a powerful prompt.',
                      'حوّل المشكلة المعقدة إلى طلب قوي.',
                    ).resolve(language),
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontSize: 27),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    LocalizedText(
                      'Describe the outcome. The Prompt Lab adds context, constraints, quality checks, and the right output format.',
                      'صف النتيجة. يضيف مختبر الطلبات السياق والقيود وفحوص الجودة وشكل الإجابة المناسب.',
                    ).resolve(language),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    key: const ValueKey('open-prompt-lab'),
                    onPressed: onStart,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.snow,
                      foregroundColor: AppColors.ink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                    ),
                    icon: const Icon(Icons.auto_fix_high_rounded),
                    label: Text(
                      LocalizedText(
                        'Build my prompt',
                        'ابنِ طلبي',
                      ).resolve(language),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.goal,
    required this.language,
    required this.onTap,
  });

  final UserGoal goal;
  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      onTap: onTap,
      child: Row(
        children: [
          AccentIcon(icon: goal.icon, color: goal.accent),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.title.resolve(language),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  goal.subtitle.resolve(language),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            language.isArabic
                ? Icons.arrow_back_rounded
                : Icons.arrow_forward_rounded,
            color: AppColors.muted,
          ),
        ],
      ),
    );
  }
}

class _TrustStrip extends StatelessWidget {
  const _TrustStrip({required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.person_off_rounded, LocalizedText('No account', 'دون حساب')),
      (
        Icons.wifi_off_rounded,
        LocalizedText('Works offline', 'يعمل دون إنترنت'),
      ),
      (
        Icons.translate_rounded,
        LocalizedText('Arabic + English', 'عربي + إنجليزي'),
      ),
    ];
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 10,
      children: [
        for (final item in items)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.$1, color: AppColors.cyan, size: 17),
              const SizedBox(width: 6),
              Text(
                item.$2.resolve(language),
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
