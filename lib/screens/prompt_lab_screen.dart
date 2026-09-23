import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../data/catalog.dart';
import '../domain/catalog_models.dart';
import '../widgets/common.dart';

class PromptLabScreen extends StatefulWidget {
  const PromptLabScreen({super.key, required this.language});

  final AppLanguage language;

  @override
  State<PromptLabScreen> createState() => _PromptLabScreenState();
}

class _PromptLabScreenState extends State<PromptLabScreen> {
  final _problemController = TextEditingController();
  final _contextController = TextEditingController();
  final _constraintsController = TextEditingController();
  final _resultKey = GlobalKey();

  String _categoryId = problemTemplates.first.id;
  String _outputStyle = 'plan';
  String? _generatedPrompt;

  ProblemTemplate get _selectedCategory =>
      problemTemplates.firstWhere((item) => item.id == _categoryId);

  @override
  void dispose() {
    _problemController.dispose();
    _contextController.dispose();
    _constraintsController.dispose();
    super.dispose();
  }

  void _useExample(LocalizedText example) {
    _problemController.text = example.resolve(widget.language);
    setState(() {});
  }

  String _styleLabel(String style, AppLanguage language) {
    return switch (style) {
      'explain' => LocalizedText(
        'Clear explanation',
        'شرح واضح',
      ).resolve(language),
      'draft' => LocalizedText(
        'Ready-to-use draft',
        'مسودة جاهزة',
      ).resolve(language),
      'compare' => LocalizedText(
        'Comparison table',
        'جدول مقارنة',
      ).resolve(language),
      _ => LocalizedText('Action plan', 'خطة عمل').resolve(language),
    };
  }

  void _generate() {
    final problem = _problemController.text.trim();
    if (problem.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocalizedText(
              'Describe the problem first.',
              'صف المشكلة أولاً.',
            ).resolve(widget.language),
          ),
        ),
      );
      return;
    }

    final contextText = _contextController.text.trim();
    final constraints = _constraintsController.text.trim();
    final category = _selectedCategory.title.resolve(widget.language);
    final output = _styleLabel(_outputStyle, widget.language);

    final prompt = widget.language.isArabic
        ? '''أنت خبير عملي في مجال: $category.

الهدف:
$problem

السياق المتوفر:
${contextText.isEmpty ? 'لا يوجد سياق إضافي. اذكر افتراضاتك بوضوح.' : contextText}

القيود والمتطلبات:
${constraints.isEmpty ? 'استخدم حلاً عملياً وآمناً ويمكن تنفيذه.' : constraints}

تعليمات العمل:
1. إذا كانت هناك معلومات أساسية ناقصة، اطرح بحد أقصى 3 أسئلة توضيحية قبل الحل.
2. افصل الحقائق عن الافتراضات واذكر ما يحتاج إلى تحقق.
3. لا تخترع مصادر أو أرقاماً أو تفاصيل غير متوفرة.
4. حلّل المشكلة خطوة بخطوة ثم أعطِ توصية واضحة قابلة للتنفيذ.
5. وضّح المخاطر والأخطاء الشائعة وكيفية تجنبها.
6. راجع إجابتك مقابل الهدف والقيود قبل تقديم النتيجة.

شكل النتيجة المطلوب:
$output، بعناوين واضحة ونقاط مختصرة وأمثلة عند الحاجة.

ابدأ بملخص من سطرين، ثم قدم النتيجة التفصيلية، واختم بأفضل خطوة تالية.'''
        : '''Act as a practical expert in: $category.

GOAL
$problem

AVAILABLE CONTEXT
${contextText.isEmpty ? 'No additional context. State your assumptions clearly.' : contextText}

CONSTRAINTS & REQUIREMENTS
${constraints.isEmpty ? 'Prefer a practical, safe, and achievable solution.' : constraints}

WORKING INSTRUCTIONS
1. If essential information is missing, ask no more than 3 clarifying questions before solving.
2. Separate facts from assumptions and flag anything that needs verification.
3. Do not invent sources, numbers, or unavailable details.
4. Reason through the problem, then provide a clear and actionable recommendation.
5. Identify risks, common mistakes, and how to avoid them.
6. Check the final answer against the goal and constraints before presenting it.

REQUIRED OUTPUT
$output, using clear headings, concise bullets, and examples where useful.

Start with a two-line summary, provide the detailed result, and end with the single best next action.''';

    setState(() => _generatedPrompt = prompt);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final target = _resultKey.currentContext;
      if (target != null) {
        Scrollable.ensureVisible(
          target,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          alignment: 0.08,
        );
      }
    });
  }

  Future<void> _copyPrompt() async {
    final prompt = _generatedPrompt;
    if (prompt == null) return;
    await Clipboard.setData(ClipboardData(text: prompt));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          LocalizedText(
            'Prompt copied',
            'تم نسخ الطلب',
          ).resolve(widget.language),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final language = widget.language;
    return CustomScrollView(
      key: const PageStorageKey('prompt-scroll'),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          sliver: SliverList.list(
            children: [
              PageIntro(
                eyebrow: const LocalizedText(
                  'Prompt studio',
                  'استوديو الطلبات',
                ),
                title: const LocalizedText(
                  'Every problem deserves a better prompt.',
                  'كل مشكلة تستحق طلباً أفضل.',
                ),
                subtitle: const LocalizedText(
                  'Choose a category, describe the outcome, and get a professional prompt that works with almost any AI assistant.',
                  'اختر الفئة وصف النتيجة واحصل على طلب احترافي يعمل مع معظم مساعدي الذكاء الاصطناعي.',
                ),
                language: language,
              ),
              const SizedBox(height: 22),
              SectionHeading(
                title: const LocalizedText(
                  '1 · Choose the problem',
                  '١ · اختر المشكلة',
                ),
                language: language,
              ),
              const SizedBox(height: 12),
              _CategoryPicker(
                language: language,
                selectedId: _categoryId,
                onSelected: (value) => setState(() => _categoryId = value),
              ),
              const SizedBox(height: 18),
              AivoraCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocalizedText(
                        'Quick starting points',
                        'نقاط بداية سريعة',
                      ).resolve(language),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final example in _selectedCategory.examples)
                          ActionChip(
                            avatar: const Icon(
                              Icons.north_west_rounded,
                              size: 15,
                            ),
                            onPressed: () => _useExample(example),
                            label: Text(example.resolve(language)),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionHeading(
                title: const LocalizedText(
                  '2 · Add what matters',
                  '٢ · أضف ما يهم',
                ),
                language: language,
              ),
              const SizedBox(height: 12),
              TextField(
                key: const ValueKey('problem-field'),
                controller: _problemController,
                minLines: 3,
                maxLines: 6,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: LocalizedText(
                    'What do you need to achieve?',
                    'ماذا تريد أن تحقق؟',
                  ).resolve(language),
                  hintText: LocalizedText(
                    'Example: Create a 30-day launch plan for my small online store.',
                    'مثال: أنشئ خطة إطلاق لمدة 30 يوماً لمتجري الإلكتروني الصغير.',
                  ).resolve(language),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _contextController,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: LocalizedText(
                    'Context (optional)',
                    'السياق (اختياري)',
                  ).resolve(language),
                  hintText: LocalizedText(
                    'Audience, background, data, or what you already tried.',
                    'الجمهور والخلفية والبيانات أو ما جربته سابقاً.',
                  ).resolve(language),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _constraintsController,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: LocalizedText(
                    'Constraints (optional)',
                    'القيود (اختياري)',
                  ).resolve(language),
                  hintText: LocalizedText(
                    'Time, budget, tools, length, rules, or things to avoid.',
                    'الوقت والميزانية والأدوات والطول والقواعد وما يجب تجنبه.',
                  ).resolve(language),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                LocalizedText(
                  'Choose the output',
                  'اختر شكل النتيجة',
                ).resolve(language),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final style in ['plan', 'explain', 'draft', 'compare'])
                    ChoiceChip(
                      selected: _outputStyle == style,
                      onSelected: (_) => setState(() => _outputStyle = style),
                      label: Text(_styleLabel(style, language)),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  key: const ValueKey('generate-prompt'),
                  onPressed: _generate,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.violet,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  icon: const Icon(Icons.auto_fix_high_rounded),
                  label: Text(
                    LocalizedText(
                      'Create professional prompt',
                      'أنشئ طلباً احترافياً',
                    ).resolve(language),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: _generatedPrompt == null
                    ? _SafetyGuide(
                        key: const ValueKey('safety'),
                        language: language,
                      )
                    : _PromptResult(
                        key: _resultKey,
                        prompt: _generatedPrompt!,
                        language: language,
                        onCopy: _copyPrompt,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryPicker extends StatelessWidget {
  const _CategoryPicker({
    required this.language,
    required this.selectedId,
    required this.onSelected,
  });

  final AppLanguage language;
  final String selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: problemTemplates.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = problemTemplates[index];
          final selected = category.id == selectedId;
          return SizedBox(
            width: 142,
            child: AivoraCard(
              onTap: () => onSelected(category.id),
              padding: const EdgeInsets.all(14),
              borderColor: selected ? category.accent : AppColors.line,
              gradient: selected
                  ? LinearGradient(
                      colors: [
                        category.accent.withValues(alpha: 0.22),
                        AppColors.panel,
                      ],
                    )
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccentIcon(
                    icon: category.icon,
                    color: category.accent,
                    size: 36,
                  ),
                  const Spacer(),
                  Text(
                    category.title.resolve(language),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PromptResult extends StatelessWidget {
  const _PromptResult({
    super.key,
    required this.prompt,
    required this.language,
    required this.onCopy,
  });

  final String prompt;
  final AppLanguage language;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return AivoraCard(
      borderColor: AppColors.cyan.withValues(alpha: 0.55),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF3A180E), Color(0xFF25132D)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AccentIcon(
                icon: Icons.check_circle_rounded,
                color: AppColors.cyan,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocalizedText(
                        'Your prompt is ready',
                        'طلبك جاهز',
                      ).resolve(language),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      LocalizedText(
                        'Works with most AI assistants',
                        'يعمل مع معظم مساعدي الذكاء',
                      ).resolve(language),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                key: const ValueKey('copy-prompt'),
                tooltip: LocalizedText(
                  'Copy prompt',
                  'نسخ الطلب',
                ).resolve(language),
                onPressed: onCopy,
                icon: const Icon(Icons.copy_all_rounded),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.ink.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.line),
            ),
            child: SelectableText(
              prompt,
              style: const TextStyle(
                color: AppColors.snow,
                height: 1.55,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SafetyGuide extends StatelessWidget {
  const _SafetyGuide({super.key, required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    final points = [
      LocalizedText(
        'Remove passwords, private records, and confidential data.',
        'احذف كلمات المرور والسجلات الخاصة والبيانات السرية.',
      ),
      LocalizedText(
        'Verify medical, legal, financial, and safety-critical advice.',
        'تحقق من النصائح الطبية والقانونية والمالية والمتعلقة بالسلامة.',
      ),
      LocalizedText(
        'Review facts, sources, calculations, and generated code.',
        'راجع الحقائق والمصادر والحسابات والكود المُنشأ.',
      ),
    ];
    return AivoraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AccentIcon(
                icon: Icons.shield_outlined,
                color: AppColors.coral,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  LocalizedText(
                    'Three rules before you prompt',
                    'ثلاث قواعد قبل إرسال الطلب',
                  ).resolve(language),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          for (var index = 0; index < points.length; index++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.coral.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: AppColors.coral,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      points[index].resolve(language),
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
