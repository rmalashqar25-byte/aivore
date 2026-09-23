import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../domain/catalog_models.dart';

const aiModels = <AiModel>[
  AiModel(
    id: 'gpt',
    name: 'GPT',
    maker: 'OpenAI',
    kind: ModelKind.general,
    tagline: LocalizedText(
      'A versatile family for reasoning, creation, and agentic work.',
      'عائلة متعددة الاستخدامات للاستدلال والإبداع وتنفيذ المهام.',
    ),
    summary: LocalizedText(
      'GPT models combine language, vision, coding, analysis, and tool use. They are a strong default when a task mixes several kinds of work or needs a polished deliverable.',
      'تجمع نماذج GPT بين اللغة والرؤية والبرمجة والتحليل واستخدام الأدوات. وهي خيار قوي عندما تجمع المهمة أكثر من نوع عمل أو تتطلب نتيجة احترافية.',
    ),
    benefits: [
      LocalizedText(
        'Strong all-round reasoning and writing',
        'قدرات قوية في الاستدلال والكتابة',
      ),
      LocalizedText(
        'Useful with documents, images, and code',
        'مفيد مع المستندات والصور والبرمجيات',
      ),
      LocalizedText(
        'Large ecosystem of tools and integrations',
        'منظومة واسعة من الأدوات والتكاملات',
      ),
    ],
    bestFor: [
      LocalizedText('Complex professional work', 'الأعمال المهنية المعقدة'),
      LocalizedText(
        'Coding and structured deliverables',
        'البرمجة والمخرجات المنظمة',
      ),
      LocalizedText('Brainstorming and learning', 'العصف الذهني والتعلّم'),
    ],
    avoid: [
      LocalizedText(
        'Treating answers as verified facts without sources',
        'اعتبار الإجابات حقائق مؤكدة دون مصادر',
      ),
      LocalizedText(
        'Sharing secrets or sensitive personal data',
        'مشاركة الأسرار أو البيانات الشخصية الحساسة',
      ),
      LocalizedText(
        'Using generated code without testing it',
        'استخدام الكود المُنشأ دون اختباره',
      ),
    ],
    platforms: ['ChatGPT', 'OpenAI API', 'Microsoft Copilot'],
    access: LocalizedText(
      'Free entry; paid plans and API usage available',
      'دخول مجاني؛ تتوفر خطط مدفوعة واستخدام عبر API',
    ),
    promptTip: LocalizedText(
      'State the goal, audience, constraints, source material, and exact output format.',
      'اذكر الهدف والجمهور والقيود والمصادر وشكل النتيجة المطلوبة بدقة.',
    ),
    accent: AppColors.cyan,
  ),
  AiModel(
    id: 'gemini',
    name: 'Gemini',
    maker: 'Google',
    kind: ModelKind.general,
    tagline: LocalizedText(
      'Multimodal intelligence connected to the Google ecosystem.',
      'ذكاء متعدد الوسائط مرتبط بمنظومة Google.',
    ),
    summary: LocalizedText(
      'Gemini handles text, images, audio, video, and code, with options ranging from fast everyday models to deeper reasoning and research experiences.',
      'يتعامل Gemini مع النص والصور والصوت والفيديو والبرمجة، ويقدم خيارات سريعة للاستخدام اليومي وأخرى للاستدلال والبحث المتعمق.',
    ),
    benefits: [
      LocalizedText(
        'Strong multimodal understanding',
        'فهم قوي للوسائط المتعددة',
      ),
      LocalizedText(
        'Convenient Google product integrations',
        'تكامل مريح مع منتجات Google',
      ),
      LocalizedText(
        'Good long-context document work',
        'جيد للتعامل مع المستندات الطويلة',
      ),
    ],
    bestFor: [
      LocalizedText('Research and summarization', 'البحث والتلخيص'),
      LocalizedText('Multimedia analysis', 'تحليل الوسائط المتعددة'),
      LocalizedText(
        'Android and Google workflows',
        'مهام Android ومنظومة Google',
      ),
    ],
    avoid: [
      LocalizedText(
        'Assuming every Google result is automatically verified',
        'افتراض أن كل نتيجة من Google موثقة تلقائياً',
      ),
      LocalizedText(
        'Uploading confidential files without checking settings',
        'رفع ملفات سرية دون مراجعة الإعدادات',
      ),
      LocalizedText(
        'Vague prompts for multi-step tasks',
        'الطلبات الغامضة للمهام متعددة الخطوات',
      ),
    ],
    platforms: ['Gemini', 'Google AI Studio', 'Vertex AI'],
    access: LocalizedText(
      'Free consumer access; paid plans and cloud API',
      'استخدام مجاني للمستهلك؛ خطط مدفوعة وواجهة سحابية',
    ),
    promptTip: LocalizedText(
      'Attach the relevant material and ask for evidence, uncertainty, and a structured answer.',
      'أرفق المواد ذات الصلة واطلب الأدلة ودرجة اليقين وإجابة منظمة.',
    ),
    accent: AppColors.blue,
  ),
  AiModel(
    id: 'claude',
    name: 'Claude',
    maker: 'Anthropic',
    kind: ModelKind.general,
    tagline: LocalizedText(
      'Thoughtful analysis, clear writing, and capable coding.',
      'تحليل متأنٍ وكتابة واضحة وبرمجة قوية.',
    ),
    summary: LocalizedText(
      'Claude is designed for language, reasoning, analysis, coding, and visual understanding. It is especially useful for carefully structured long-form work.',
      'صُمم Claude للغة والاستدلال والتحليل والبرمجة وفهم الصور، ويفيد خصوصاً في الأعمال الطويلة والمنظمة بعناية.',
    ),
    benefits: [
      LocalizedText('Clear long-form writing', 'كتابة طويلة وواضحة'),
      LocalizedText(
        'Strong coding and document analysis',
        'قوي في البرمجة وتحليل المستندات',
      ),
      LocalizedText('Careful instruction following', 'اتباع دقيق للتعليمات'),
    ],
    bestFor: [
      LocalizedText(
        'Editing and policy documents',
        'تحرير المستندات والسياسات',
      ),
      LocalizedText(
        'Software planning and code review',
        'تخطيط البرمجيات ومراجعة الكود',
      ),
      LocalizedText('Nuanced analysis', 'التحليل الدقيق والمتوازن'),
    ],
    avoid: [
      LocalizedText(
        'Expecting live information without enabled tools',
        'توقع معلومات مباشرة دون أدوات مفعلة',
      ),
      LocalizedText(
        'Making high-stakes decisions from one answer',
        'اتخاذ قرارات مصيرية اعتماداً على إجابة واحدة',
      ),
      LocalizedText(
        'Leaving the desired format undefined',
        'ترك شكل النتيجة المطلوبة دون تحديد',
      ),
    ],
    platforms: ['Claude.ai', 'Anthropic API', 'Cloud partners'],
    access: LocalizedText(
      'Free tier in supported regions; paid plans and API',
      'خطة مجانية في المناطق المدعومة؛ خطط مدفوعة وAPI',
    ),
    promptTip: LocalizedText(
      'Give context, define success criteria, and ask it to note assumptions before answering.',
      'قدم السياق وحدد معايير النجاح واطلب منه ذكر الافتراضات قبل الإجابة.',
    ),
    accent: AppColors.coral,
  ),
  AiModel(
    id: 'grok',
    name: 'Grok',
    maker: 'xAI',
    kind: ModelKind.research,
    tagline: LocalizedText(
      'Conversational reasoning with optional real-time search tools.',
      'استدلال حواري مع أدوات اختيارية للبحث الآني.',
    ),
    summary: LocalizedText(
      'Grok supports chat, coding, file analysis, voice, and creative media. Current information depends on enabling its web or X search tools.',
      'يدعم Grok المحادثة والبرمجة وتحليل الملفات والصوت والوسائط الإبداعية. وتعتمد المعلومات الحالية على تفعيل البحث في الويب أو X.',
    ),
    benefits: [
      LocalizedText(
        'Strong general and coding capability',
        'قدرات قوية عامة وفي البرمجة',
      ),
      LocalizedText(
        'Optional web and X search',
        'بحث اختياري في الويب ومنصة X',
      ),
      LocalizedText(
        'Chat, voice, image, and video experiences',
        'تجارب محادثة وصوت وصور وفيديو',
      ),
    ],
    bestFor: [
      LocalizedText('Timely topic exploration', 'استكشاف المواضيع الآنية'),
      LocalizedText(
        'Coding and technical questions',
        'البرمجة والأسئلة التقنية',
      ),
      LocalizedText('Conversational brainstorming', 'العصف الذهني الحواري'),
    ],
    avoid: [
      LocalizedText(
        'Confusing confident tone with accuracy',
        'الخلط بين النبرة الواثقة والدقة',
      ),
      LocalizedText(
        'Citing posts without opening the source',
        'الاستشهاد بالمنشورات دون فتح المصدر',
      ),
      LocalizedText(
        'Using trends as representative evidence',
        'اعتبار الاتجاهات دليلاً ممثلاً للجميع',
      ),
    ],
    platforms: ['Grok', 'xAI API', 'X'],
    access: LocalizedText(
      'Free to start; higher limits on paid plans',
      'مجاني للبدء؛ حدود أعلى في الخطط المدفوعة',
    ),
    promptTip: LocalizedText(
      'Ask for direct source links, dates, and a separation between facts and interpretation.',
      'اطلب روابط المصادر المباشرة والتواريخ والفصل بين الحقائق والتفسير.',
    ),
    accent: Color(0xFFE8EDF7),
  ),
  AiModel(
    id: 'deepseek',
    name: 'DeepSeek',
    maker: 'DeepSeek',
    kind: ModelKind.coding,
    tagline: LocalizedText(
      'Reasoning and coding models with accessible deployment options.',
      'نماذج للاستدلال والبرمجة مع خيارات وصول ونشر متعددة.',
    ),
    summary: LocalizedText(
      'DeepSeek provides general, reasoning, and coding-oriented models through its app, API, and downloadable model releases.',
      'يقدم DeepSeek نماذج عامة ومتخصصة في الاستدلال والبرمجة عبر التطبيق وAPI وإصدارات قابلة للتنزيل.',
    ),
    benefits: [
      LocalizedText(
        'Strong math and coding workflows',
        'قوي في الرياضيات والبرمجة',
      ),
      LocalizedText('Competitive API access', 'وصول منافس عبر API'),
      LocalizedText(
        'Some downloadable model releases',
        'بعض الإصدارات قابلة للتنزيل',
      ),
    ],
    bestFor: [
      LocalizedText(
        'Step-by-step technical reasoning',
        'الاستدلال التقني خطوة بخطوة',
      ),
      LocalizedText(
        'Code generation and debugging',
        'إنشاء الكود وتصحيح الأخطاء',
      ),
      LocalizedText(
        'Experimentation with open models',
        'تجربة النماذج المفتوحة',
      ),
    ],
    avoid: [
      LocalizedText(
        'Running generated commands without review',
        'تشغيل أوامر منشأة دون مراجعة',
      ),
      LocalizedText(
        'Sending regulated or private data',
        'إرسال بيانات خاصة أو خاضعة للتنظيم',
      ),
      LocalizedText(
        'Accepting a long chain of reasoning as proof',
        'اعتبار سلسلة الاستدلال الطويلة دليلاً',
      ),
    ],
    platforms: ['DeepSeek Chat', 'DeepSeek API', 'Hugging Face'],
    access: LocalizedText(
      'Free chat access; API and self-hosted options vary',
      'محادثة مجانية؛ تختلف خيارات API والاستضافة الذاتية',
    ),
    promptTip: LocalizedText(
      'Provide inputs, expected outputs, constraints, and tests for technical tasks.',
      'قدم المدخلات والمخرجات المتوقعة والقيود والاختبارات للمهام التقنية.',
    ),
    accent: Color(0xFFFF9A3C),
  ),
  AiModel(
    id: 'llama',
    name: 'Llama',
    maker: 'Meta',
    kind: ModelKind.openSource,
    tagline: LocalizedText(
      'Open-weight models for customization and private deployment.',
      'نماذج بأوزان متاحة للتخصيص والنشر الخاص.',
    ),
    summary: LocalizedText(
      'Llama is a family of open-weight models used by developers and platforms to build assistants, local tools, and customized AI systems.',
      'Llama عائلة من النماذج ذات الأوزان المتاحة يستخدمها المطورون والمنصات لبناء مساعدين وأدوات محلية وأنظمة ذكاء مخصصة.',
    ),
    benefits: [
      LocalizedText(
        'Can be customized and self-hosted',
        'يمكن تخصيصها واستضافتها ذاتياً',
      ),
      LocalizedText('Broad community ecosystem', 'منظومة مجتمعية واسعة'),
      LocalizedText(
        'More deployment and privacy control',
        'تحكم أكبر في النشر والخصوصية',
      ),
    ],
    bestFor: [
      LocalizedText(
        'Private or on-device prototypes',
        'النماذج الأولية الخاصة أو على الجهاز',
      ),
      LocalizedText('Fine-tuning for a domain', 'الضبط لمجال متخصص'),
      LocalizedText(
        'Learning how LLM systems work',
        'تعلم آلية عمل أنظمة اللغة',
      ),
    ],
    avoid: [
      LocalizedText(
        'Calling open weights the same as unrestricted software',
        'اعتبار الأوزان المتاحة برمجيات بلا قيود',
      ),
      LocalizedText(
        'Deploying without safety and monitoring',
        'النشر دون حماية ومراقبة',
      ),
      LocalizedText(
        'Ignoring hardware and maintenance cost',
        'تجاهل تكلفة الأجهزة والصيانة',
      ),
    ],
    platforms: ['Meta AI', 'Hugging Face', 'Cloud providers'],
    access: LocalizedText(
      'Consumer access and downloadable releases; license applies',
      'وصول للمستهلك وإصدارات قابلة للتنزيل؛ يخضع للترخيص',
    ),
    promptTip: LocalizedText(
      'Use a clear system instruction and test your chosen version on real examples.',
      'استخدم تعليمات نظام واضحة واختبر الإصدار المختار على أمثلة حقيقية.',
    ),
    accent: Color(0xFFB46CFF),
  ),
  AiModel(
    id: 'mistral',
    name: 'Mistral',
    maker: 'Mistral AI',
    kind: ModelKind.openSource,
    tagline: LocalizedText(
      'Efficient European model families for apps and deployment.',
      'عائلات نماذج فعالة للتطبيقات والنشر من شركة أوروبية.',
    ),
    summary: LocalizedText(
      'Mistral offers commercial and open-weight models for chat, coding, multilingual work, and enterprise applications.',
      'تقدم Mistral نماذج تجارية وأخرى بأوزان متاحة للمحادثة والبرمجة والعمل متعدد اللغات وتطبيقات المؤسسات.',
    ),
    benefits: [
      LocalizedText('Efficient deployment choices', 'خيارات نشر فعالة'),
      LocalizedText(
        'Multilingual and coding options',
        'خيارات متعددة اللغات وللبرمجة',
      ),
      LocalizedText(
        'API and self-hosting paths',
        'مسارات عبر API أو الاستضافة الذاتية',
      ),
    ],
    bestFor: [
      LocalizedText(
        'European enterprise requirements',
        'متطلبات المؤسسات الأوروبية',
      ),
      LocalizedText('Efficient custom assistants', 'مساعدون مخصصون بكفاءة'),
      LocalizedText('Multilingual applications', 'التطبيقات متعددة اللغات'),
    ],
    avoid: [
      LocalizedText(
        'Assuming every model has the same license',
        'افتراض أن كل النماذج لها الترخيص نفسه',
      ),
      LocalizedText(
        'Choosing by benchmark alone',
        'الاختيار بالاعتماد على معيار واحد فقط',
      ),
      LocalizedText(
        'Skipping evaluation in your language',
        'تخطي التقييم بلغتك الفعلية',
      ),
    ],
    platforms: ['Le Chat', 'La Plateforme', 'Cloud providers'],
    access: LocalizedText(
      'Free chat tier; API and deployment pricing vary',
      'خطة محادثة مجانية؛ تختلف أسعار API والنشر',
    ),
    promptTip: LocalizedText(
      'Name the target language, domain vocabulary, and format explicitly.',
      'حدد اللغة المستهدفة ومصطلحات المجال وشكل النتيجة بوضوح.',
    ),
    accent: AppColors.gold,
  ),
  AiModel(
    id: 'qwen',
    name: 'Qwen',
    maker: 'Alibaba Cloud',
    kind: ModelKind.openSource,
    tagline: LocalizedText(
      'A broad multilingual family spanning text, code, vision, and audio.',
      'عائلة واسعة متعددة اللغات تشمل النص والبرمجة والرؤية والصوت.',
    ),
    summary: LocalizedText(
      'Qwen includes general and specialized models distributed through cloud services and open model communities.',
      'تشمل Qwen نماذج عامة ومتخصصة موزعة عبر الخدمات السحابية ومجتمعات النماذج المفتوحة.',
    ),
    benefits: [
      LocalizedText(
        'Wide range of model sizes and specialties',
        'نطاق واسع من الأحجام والتخصصات',
      ),
      LocalizedText('Strong multilingual focus', 'تركيز قوي على تعدد اللغات'),
      LocalizedText(
        'Open-weight choices for developers',
        'خيارات بأوزان متاحة للمطورين',
      ),
    ],
    bestFor: [
      LocalizedText('Multilingual experiments', 'التجارب متعددة اللغات'),
      LocalizedText(
        'Custom coding and vision systems',
        'أنظمة مخصصة للبرمجة والرؤية',
      ),
      LocalizedText(
        'Comparing local model sizes',
        'مقارنة أحجام النماذج المحلية',
      ),
    ],
    avoid: [
      LocalizedText(
        'Ignoring regional availability',
        'تجاهل توفر الخدمة حسب المنطقة',
      ),
      LocalizedText(
        'Using a model too large for your hardware',
        'استخدام نموذج أكبر من قدرة الجهاز',
      ),
      LocalizedText(
        'Skipping Arabic quality checks',
        'تخطي فحص الجودة باللغة العربية',
      ),
    ],
    platforms: ['Qwen Chat', 'Alibaba Cloud', 'Hugging Face'],
    access: LocalizedText(
      'Chat, cloud API, and downloadable releases vary',
      'تختلف خيارات المحادثة وAPI السحابي والإصدارات القابلة للتنزيل',
    ),
    promptTip: LocalizedText(
      'Test the same prompt in both target languages and compare meaning, not wording.',
      'اختبر الطلب نفسه باللغتين وقارن المعنى لا الصياغة فقط.',
    ),
    accent: Color(0xFFD06CFF),
  ),
  AiModel(
    id: 'sonar',
    name: 'Sonar',
    maker: 'Perplexity',
    kind: ModelKind.research,
    tagline: LocalizedText(
      'Search-grounded answers designed around web research.',
      'إجابات مدعومة بالبحث ومصممة للاستكشاف عبر الويب.',
    ),
    summary: LocalizedText(
      'Sonar powers research-oriented answers that combine model reasoning with web retrieval and citations.',
      'يدعم Sonar إجابات بحثية تجمع بين استدلال النموذج واسترجاع معلومات الويب والاستشهادات.',
    ),
    benefits: [
      LocalizedText('Fast cited research', 'بحث سريع مع مصادر'),
      LocalizedText('Useful follow-up exploration', 'استكشاف متتابع مفيد'),
      LocalizedText(
        'API options for search-grounded apps',
        'خيارات API للتطبيقات المدعومة بالبحث',
      ),
    ],
    bestFor: [
      LocalizedText(
        'Finding a starting set of sources',
        'إيجاد مجموعة أولية من المصادر',
      ),
      LocalizedText(
        'Comparing current products or topics',
        'مقارنة منتجات أو مواضيع حالية',
      ),
      LocalizedText('Research question refinement', 'تحسين سؤال البحث'),
    ],
    avoid: [
      LocalizedText(
        'Citing the summary instead of the original source',
        'الاستشهاد بالملخص بدلاً من المصدر الأصلي',
      ),
      LocalizedText(
        'Trusting every citation without opening it',
        'الثقة بكل استشهاد دون فتحه',
      ),
      LocalizedText(
        'Using only one search query',
        'استخدام استعلام بحث واحد فقط',
      ),
    ],
    platforms: ['Perplexity', 'Perplexity API'],
    access: LocalizedText(
      'Free search tier; Pro and API plans available',
      'بحث مجاني؛ تتوفر خطط Pro وAPI',
    ),
    promptTip: LocalizedText(
      'Set a date range and request primary sources plus a short evidence table.',
      'حدد نطاقاً زمنياً واطلب مصادر أولية وجدول أدلة مختصراً.',
    ),
    accent: AppColors.cyan,
  ),
  AiModel(
    id: 'midjourney',
    name: 'Midjourney',
    maker: 'Midjourney',
    kind: ModelKind.image,
    tagline: LocalizedText(
      'Stylized image generation with strong visual direction.',
      'إنشاء صور بأسلوب بصري قوي وتوجيه فني واضح.',
    ),
    summary: LocalizedText(
      'Midjourney turns text and image references into illustrations, concepts, and polished visual variations.',
      'يحوّل Midjourney النصوص والصور المرجعية إلى رسومات ومفاهيم وتنويعات بصرية مصقولة.',
    ),
    benefits: [
      LocalizedText('High visual polish', 'جودة بصرية مصقولة'),
      LocalizedText('Strong style exploration', 'استكشاف قوي للأساليب'),
      LocalizedText('Rapid creative variations', 'تنويعات إبداعية سريعة'),
    ],
    bestFor: [
      LocalizedText(
        'Concept art and moodboards',
        'الفن التصوري ولوحات الإلهام',
      ),
      LocalizedText(
        'Campaign and brand exploration',
        'استكشاف الحملات والعلامات',
      ),
      LocalizedText('Illustration ideas', 'أفكار الرسوم التوضيحية'),
    ],
    avoid: [
      LocalizedText(
        'Using outputs as an exact factual depiction',
        'استخدام النتائج كتصوير واقعي دقيق',
      ),
      LocalizedText(
        'Requesting living artists by imitation',
        'طلب تقليد فنانين أحياء',
      ),
      LocalizedText(
        'Publishing without checking usage rights',
        'النشر دون مراجعة حقوق الاستخدام',
      ),
    ],
    platforms: ['Midjourney Web', 'Discord'],
    access: LocalizedText(
      'Primarily paid subscription access',
      'يعتمد أساساً على الاشتراك المدفوع',
    ),
    promptTip: LocalizedText(
      'Describe subject, composition, lighting, palette, lens, mood, and aspect ratio.',
      'صف الموضوع والتكوين والإضاءة والألوان والعدسة والمزاج ونسبة الأبعاد.',
    ),
    accent: Color(0xFFFF6FB1),
  ),
  AiModel(
    id: 'stable-diffusion',
    name: 'Stable Diffusion',
    maker: 'Stability AI / community',
    kind: ModelKind.image,
    tagline: LocalizedText(
      'Customizable image models with local and hosted workflows.',
      'نماذج صور قابلة للتخصيص مع تشغيل محلي أو مستضاف.',
    ),
    summary: LocalizedText(
      'Stable Diffusion refers to an ecosystem of image-generation models and community tools that provide deep control over generation workflows.',
      'يشير Stable Diffusion إلى منظومة نماذج وأدوات مجتمعية لإنشاء الصور توفر تحكماً عميقاً في سير العمل.',
    ),
    benefits: [
      LocalizedText('Fine-grained workflow control', 'تحكم دقيق في سير العمل'),
      LocalizedText(
        'Local and private generation options',
        'خيارات إنشاء محلية وخاصة',
      ),
      LocalizedText(
        'Large ecosystem of tools and models',
        'منظومة كبيرة من الأدوات والنماذج',
      ),
    ],
    bestFor: [
      LocalizedText('Custom visual pipelines', 'مسارات بصرية مخصصة'),
      LocalizedText(
        'Product mockups and experimentation',
        'نماذج المنتجات والتجريب',
      ),
      LocalizedText('Learning image model workflows', 'تعلم آليات نماذج الصور'),
    ],
    avoid: [
      LocalizedText(
        'Downloading unknown model files',
        'تنزيل ملفات نماذج مجهولة',
      ),
      LocalizedText('Ignoring each model license', 'تجاهل ترخيص كل نموذج'),
      LocalizedText(
        'Generating deceptive or harmful media',
        'إنشاء وسائط مضللة أو ضارة',
      ),
    ],
    platforms: ['DreamStudio', 'Hugging Face', 'Local tools'],
    access: LocalizedText(
      'Open and hosted options; compute costs vary',
      'خيارات مفتوحة ومستضافة؛ تختلف تكلفة الحوسبة',
    ),
    promptTip: LocalizedText(
      'Use positive and negative constraints, then change one variable per iteration.',
      'استخدم القيود الإيجابية والسلبية وغيّر متغيراً واحداً في كل تجربة.',
    ),
    accent: Color(0xFFC27AFF),
  ),
  AiModel(
    id: 'runway',
    name: 'Runway',
    maker: 'Runway',
    kind: ModelKind.video,
    tagline: LocalizedText(
      'Generative video tools for shots, motion, and creative editing.',
      'أدوات فيديو توليدية للمشاهد والحركة والتحرير الإبداعي.',
    ),
    summary: LocalizedText(
      'Runway combines video generation and editing tools for creators producing short shots, prototypes, and visual effects.',
      'يجمع Runway بين إنشاء الفيديو وأدوات التحرير للمبدعين الذين ينتجون لقطات قصيرة ونماذج أولية ومؤثرات بصرية.',
    ),
    benefits: [
      LocalizedText('Fast visual prototyping', 'نمذجة بصرية سريعة'),
      LocalizedText(
        'Text, image, and video workflows',
        'مسارات نص وصورة وفيديو',
      ),
      LocalizedText(
        'Creative editing in one platform',
        'تحرير إبداعي في منصة واحدة',
      ),
    ],
    bestFor: [
      LocalizedText(
        'Storyboards and short shots',
        'لوحات القصة واللقطات القصيرة',
      ),
      LocalizedText('Marketing concepts', 'مفاهيم تسويقية'),
      LocalizedText('Motion experiments', 'تجارب الحركة'),
    ],
    avoid: [
      LocalizedText(
        'Expecting perfect long-scene continuity',
        'توقع استمرارية مثالية في المشاهد الطويلة',
      ),
      LocalizedText(
        'Using real identities without consent',
        'استخدام هوية أشخاص دون موافقة',
      ),
      LocalizedText(
        'Skipping frame-by-frame review',
        'تخطي المراجعة إطاراً بإطار',
      ),
    ],
    platforms: ['Runway Web'],
    access: LocalizedText(
      'Limited free credits; paid plans for regular use',
      'رصيد مجاني محدود؛ خطط مدفوعة للاستخدام المنتظم',
    ),
    promptTip: LocalizedText(
      'Write one shot: subject, action, camera movement, setting, light, and duration.',
      'اكتب لقطة واحدة: الموضوع والحركة والكاميرا والمكان والإضاءة والمدة.',
    ),
    accent: Color(0xFFFFB23E),
  ),
  AiModel(
    id: 'elevenlabs',
    name: 'ElevenLabs',
    maker: 'ElevenLabs',
    kind: ModelKind.audio,
    tagline: LocalizedText(
      'Speech generation, dubbing, and voice workflows.',
      'إنشاء الكلام والدبلجة ومسارات العمل الصوتية.',
    ),
    summary: LocalizedText(
      'ElevenLabs provides AI speech and audio tools for narration, dubbing, conversational agents, and sound generation.',
      'توفر ElevenLabs أدوات كلام وصوت بالذكاء الاصطناعي للسرد والدبلجة والوكلاء الحواريين وإنشاء المؤثرات.',
    ),
    benefits: [
      LocalizedText('Natural speech generation', 'إنشاء كلام طبيعي'),
      LocalizedText('Multilingual dubbing tools', 'أدوات دبلجة متعددة اللغات'),
      LocalizedText('Voice and agent APIs', 'واجهات للصوت والوكلاء'),
    ],
    bestFor: [
      LocalizedText('Narration and accessibility', 'السرد وإمكانية الوصول'),
      LocalizedText('Localized media', 'توطين الوسائط'),
      LocalizedText('Voice prototypes', 'نماذج أولية صوتية'),
    ],
    avoid: [
      LocalizedText(
        'Cloning a voice without permission',
        'استنساخ صوت دون إذن',
      ),
      LocalizedText(
        'Hiding that synthetic audio is synthetic',
        'إخفاء أن الصوت مُنشأ اصطناعياً',
      ),
      LocalizedText(
        'Publishing without pronunciation review',
        'النشر دون مراجعة النطق',
      ),
    ],
    platforms: ['ElevenLabs Web', 'ElevenLabs API'],
    access: LocalizedText(
      'Free entry tier; paid plans increase usage',
      'خطة دخول مجانية؛ تزيد الخطط المدفوعة حدود الاستخدام',
    ),
    promptTip: LocalizedText(
      'Write for speaking, add pronunciation guidance, and specify pace and emotion.',
      'اكتب للنطق وأضف إرشادات اللفظ وحدد السرعة والعاطفة.',
    ),
    accent: Color(0xFFFF8A35),
  ),
];

const aiPlatforms = <AiPlatform>[
  AiPlatform(
    name: 'ChatGPT',
    company: 'OpenAI',
    kind: PlatformKind.assistant,
    description: LocalizedText(
      'General assistant for writing, learning, coding, images, files, and multi-step work.',
      'مساعد عام للكتابة والتعلم والبرمجة والصور والملفات والمهام متعددة الخطوات.',
    ),
    models: ['GPT'],
    freeTier: true,
    access: LocalizedText('Web, Android, iOS', 'ويب، Android، iOS'),
    website: 'chatgpt.com',
    accent: AppColors.cyan,
  ),
  AiPlatform(
    name: 'Gemini',
    company: 'Google',
    kind: PlatformKind.assistant,
    description: LocalizedText(
      'Multimodal assistant integrated with Google products and research workflows.',
      'مساعد متعدد الوسائط متكامل مع منتجات Google ومسارات البحث.',
    ),
    models: ['Gemini'],
    freeTier: true,
    access: LocalizedText('Web, Android, iOS', 'ويب، Android، iOS'),
    website: 'gemini.google.com',
    accent: AppColors.blue,
  ),
  AiPlatform(
    name: 'Claude',
    company: 'Anthropic',
    kind: PlatformKind.assistant,
    description: LocalizedText(
      'A focused workspace for writing, document analysis, reasoning, and coding.',
      'مساحة مركزة للكتابة وتحليل المستندات والاستدلال والبرمجة.',
    ),
    models: ['Claude'],
    freeTier: true,
    access: LocalizedText('Web, Android, iOS, API', 'ويب، Android، iOS، API'),
    website: 'claude.ai',
    accent: AppColors.coral,
  ),
  AiPlatform(
    name: 'Grok',
    company: 'xAI',
    kind: PlatformKind.assistant,
    description: LocalizedText(
      'Chat, search, code, voice, and media creation in the Grok and X ecosystem.',
      'محادثة وبحث وبرمجة وصوت وإنشاء وسائط ضمن منظومة Grok وX.',
    ),
    models: ['Grok'],
    freeTier: true,
    access: LocalizedText(
      'Web, Android, iOS, X, API',
      'ويب، Android، iOS، X، API',
    ),
    website: 'grok.com',
    accent: Color(0xFFE8EDF7),
  ),
  AiPlatform(
    name: 'Perplexity',
    company: 'Perplexity',
    kind: PlatformKind.productivity,
    description: LocalizedText(
      'Answer engine built around web search, citations, and follow-up research.',
      'محرك إجابات مبني حول بحث الويب والمصادر والبحث المتتابع.',
    ),
    models: ['Sonar', 'Partner models'],
    freeTier: true,
    access: LocalizedText('Web, Android, iOS, API', 'ويب، Android، iOS، API'),
    website: 'perplexity.ai',
    accent: AppColors.cyan,
  ),
  AiPlatform(
    name: 'Google AI Studio',
    company: 'Google',
    kind: PlatformKind.developer,
    description: LocalizedText(
      'Browser workspace for testing Gemini prompts and building API prototypes.',
      'مساحة في المتصفح لاختبار طلبات Gemini وبناء نماذج API أولية.',
    ),
    models: ['Gemini'],
    freeTier: true,
    access: LocalizedText('Web developer tool', 'أداة ويب للمطورين'),
    website: 'aistudio.google.com',
    accent: AppColors.blue,
  ),
  AiPlatform(
    name: 'OpenRouter',
    company: 'OpenRouter',
    kind: PlatformKind.developer,
    description: LocalizedText(
      'One API and playground for comparing models from many providers.',
      'واجهة واحدة وساحة تجربة لمقارنة نماذج من مزودين متعددين.',
    ),
    models: ['Many providers'],
    freeTier: true,
    access: LocalizedText('Web playground and API', 'ساحة ويب وAPI'),
    website: 'openrouter.ai',
    accent: AppColors.violet,
  ),
  AiPlatform(
    name: 'Hugging Face',
    company: 'Hugging Face',
    kind: PlatformKind.openModels,
    description: LocalizedText(
      'Community hub for discovering, testing, and downloading models and datasets.',
      'مركز مجتمعي لاكتشاف النماذج والبيانات واختبارها وتنزيلها.',
    ),
    models: ['Llama', 'Mistral', 'Qwen', 'Thousands more'],
    freeTier: true,
    access: LocalizedText(
      'Web, libraries, hosted inference',
      'ويب ومكتبات واستدلال مستضاف',
    ),
    website: 'huggingface.co',
    accent: AppColors.gold,
  ),
  AiPlatform(
    name: 'Midjourney',
    company: 'Midjourney',
    kind: PlatformKind.creative,
    description: LocalizedText(
      'Visual creation platform for polished image concepts and variations.',
      'منصة إبداع بصري لمفاهيم الصور المصقولة وتنويعاتها.',
    ),
    models: ['Midjourney'],
    freeTier: false,
    access: LocalizedText('Web and Discord', 'ويب وDiscord'),
    website: 'midjourney.com',
    accent: Color(0xFFFF6FB1),
  ),
  AiPlatform(
    name: 'Runway',
    company: 'Runway',
    kind: PlatformKind.creative,
    description: LocalizedText(
      'Generative video workspace for clips, effects, and visual prototypes.',
      'مساحة فيديو توليدي للمقاطع والمؤثرات والنماذج البصرية.',
    ),
    models: ['Runway video models'],
    freeTier: true,
    access: LocalizedText('Web', 'ويب'),
    website: 'runwayml.com',
    accent: Color(0xFFFFB23E),
  ),
  AiPlatform(
    name: 'ElevenLabs',
    company: 'ElevenLabs',
    kind: PlatformKind.creative,
    description: LocalizedText(
      'Voice, narration, dubbing, and conversational audio platform.',
      'منصة للصوت والسرد والدبلجة والمحادثة الصوتية.',
    ),
    models: ['Speech and audio models'],
    freeTier: true,
    access: LocalizedText('Web and API', 'ويب وAPI'),
    website: 'elevenlabs.io',
    accent: Color(0xFFFF8A35),
  ),
  AiPlatform(
    name: 'Canva Magic Studio',
    company: 'Canva',
    kind: PlatformKind.productivity,
    description: LocalizedText(
      'AI-assisted presentations, social designs, images, copy, and editing.',
      'عروض وتصاميم اجتماعية وصور ونصوص وتحرير بمساعدة الذكاء الاصطناعي.',
    ),
    models: ['Canva and partner models'],
    freeTier: true,
    access: LocalizedText('Web, Android, iOS', 'ويب، Android، iOS'),
    website: 'canva.com',
    accent: Color(0xFFBA65F2),
  ),
];

const problemTemplates = <ProblemTemplate>[
  ProblemTemplate(
    id: 'study',
    icon: Icons.school_rounded,
    title: LocalizedText('Study & learn', 'الدراسة والتعلّم'),
    description: LocalizedText(
      'Understand, practice, revise, and build a learning plan.',
      'افهم وتدرّب وراجع وابنِ خطة تعلم.',
    ),
    examples: [
      LocalizedText('Explain a difficult concept', 'اشرح مفهوماً صعباً'),
      LocalizedText('Create a study plan', 'أنشئ خطة دراسة'),
      LocalizedText('Practice with feedback', 'تدرّب مع تغذية راجعة'),
    ],
    accent: AppColors.blue,
  ),
  ProblemTemplate(
    id: 'work',
    icon: Icons.work_rounded,
    title: LocalizedText('Work & productivity', 'العمل والإنتاجية'),
    description: LocalizedText(
      'Plan, write, analyze, and turn information into action.',
      'خطط واكتب وحلل وحوّل المعلومات إلى عمل.',
    ),
    examples: [
      LocalizedText('Draft a professional document', 'اكتب مستنداً مهنياً'),
      LocalizedText('Summarize a meeting', 'لخّص اجتماعاً'),
      LocalizedText('Prioritize a busy week', 'رتّب أولويات أسبوع مزدحم'),
    ],
    accent: AppColors.cyan,
  ),
  ProblemTemplate(
    id: 'code',
    icon: Icons.code_rounded,
    title: LocalizedText('Code & technology', 'البرمجة والتقنية'),
    description: LocalizedText(
      'Design, debug, test, and learn software responsibly.',
      'صمم وصحح واختبر وتعلم البرمجيات بمسؤولية.',
    ),
    examples: [
      LocalizedText('Debug an error', 'صحح خطأ'),
      LocalizedText('Plan an application', 'خطط لتطبيق'),
      LocalizedText('Review code safely', 'راجع الكود بأمان'),
    ],
    accent: Color(0xFFFFB84D),
  ),
  ProblemTemplate(
    id: 'content',
    icon: Icons.draw_rounded,
    title: LocalizedText('Content & creativity', 'المحتوى والإبداع'),
    description: LocalizedText(
      'Generate original directions, scripts, visuals, and campaigns.',
      'ابتكر اتجاهات أصلية ونصوصاً ومرئيات وحملات.',
    ),
    examples: [
      LocalizedText('Plan a video script', 'خطط لنص فيديو'),
      LocalizedText('Develop a brand concept', 'طور فكرة علامة'),
      LocalizedText('Improve a draft', 'حسّن مسودة'),
    ],
    accent: Color(0xFFFF6FB1),
  ),
  ProblemTemplate(
    id: 'business',
    icon: Icons.insights_rounded,
    title: LocalizedText('Business & decisions', 'الأعمال والقرارات'),
    description: LocalizedText(
      'Explore options, test assumptions, and structure decisions.',
      'استكشف الخيارات واختبر الافتراضات ونظّم القرارات.',
    ),
    examples: [
      LocalizedText('Compare business options', 'قارن خيارات العمل'),
      LocalizedText('Analyze customer feedback', 'حلل آراء العملاء'),
      LocalizedText('Prepare a launch plan', 'جهّز خطة إطلاق'),
    ],
    accent: AppColors.gold,
  ),
  ProblemTemplate(
    id: 'career',
    icon: Icons.rocket_launch_rounded,
    title: LocalizedText('Career & communication', 'المهنة والتواصل'),
    description: LocalizedText(
      'Prepare applications, interviews, messages, and growth plans.',
      'جهّز الطلبات والمقابلات والرسائل وخطط التطور.',
    ),
    examples: [
      LocalizedText('Improve a résumé', 'حسّن السيرة الذاتية'),
      LocalizedText('Practice an interview', 'تدرّب على مقابلة'),
      LocalizedText('Write a difficult message', 'اكتب رسالة صعبة'),
    ],
    accent: AppColors.coral,
  ),
  ProblemTemplate(
    id: 'research',
    icon: Icons.science_rounded,
    title: LocalizedText('Research & evidence', 'البحث والأدلة'),
    description: LocalizedText(
      'Form questions, find evidence, compare sources, and expose gaps.',
      'صغ الأسئلة وابحث عن الأدلة وقارن المصادر واكشف الثغرات.',
    ),
    examples: [
      LocalizedText('Build a research plan', 'ابنِ خطة بحث'),
      LocalizedText('Compare sources', 'قارن المصادر'),
      LocalizedText('Identify evidence gaps', 'حدد فجوات الأدلة'),
    ],
    accent: Color(0xFFA78BFA),
  ),
  ProblemTemplate(
    id: 'daily',
    icon: Icons.self_improvement_rounded,
    title: LocalizedText('Everyday life', 'الحياة اليومية'),
    description: LocalizedText(
      'Organize, plan, learn, and think through ordinary challenges.',
      'نظّم وخطط وتعلم وفكر في تحديات الحياة اليومية.',
    ),
    examples: [
      LocalizedText('Plan a trip or event', 'خطط لرحلة أو مناسبة'),
      LocalizedText('Compare a purchase', 'قارن عملية شراء'),
      LocalizedText('Build a healthy routine', 'ابنِ روتيناً صحياً'),
    ],
    accent: Color(0xFFFFA45B),
  ),
];

const userGoals = <UserGoal>[
  UserGoal(
    icon: Icons.explore_rounded,
    title: LocalizedText('Choose the right AI', 'اختر الذكاء المناسب'),
    subtitle: LocalizedText(
      'Compare strengths, limits, and ideal use cases.',
      'قارن نقاط القوة والحدود والاستخدام المناسب.',
    ),
    targetTab: 1,
    accent: AppColors.violet,
  ),
  UserGoal(
    icon: Icons.grid_view_rounded,
    title: LocalizedText('Find a platform', 'ابحث عن منصة'),
    subtitle: LocalizedText(
      'See where to use AI and whether it has free access.',
      'اعرف أين تستخدم الذكاء وهل يتوفر مجاناً.',
    ),
    targetTab: 2,
    accent: AppColors.blue,
  ),
  UserGoal(
    icon: Icons.auto_fix_high_rounded,
    title: LocalizedText('Build the perfect prompt', 'ابنِ الطلب المثالي'),
    subtitle: LocalizedText(
      'Turn any problem into a clear, reusable instruction.',
      'حوّل أي مشكلة إلى تعليمات واضحة قابلة للاستخدام.',
    ),
    targetTab: 3,
    accent: AppColors.cyan,
  ),
  UserGoal(
    icon: Icons.shield_rounded,
    title: LocalizedText('Use AI responsibly', 'استخدم الذكاء بمسؤولية'),
    subtitle: LocalizedText(
      'Learn what to verify, protect, and avoid.',
      'تعلم ما يجب التحقق منه وحمايته وتجنبه.',
    ),
    targetTab: 1,
    accent: AppColors.coral,
  ),
];
