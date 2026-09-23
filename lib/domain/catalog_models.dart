import 'package:flutter/material.dart';

import '../core/localized_text.dart';

enum ModelKind { general, coding, research, image, video, audio, openSource }

extension ModelKindX on ModelKind {
  LocalizedText get label => switch (this) {
    ModelKind.general => const LocalizedText('General', 'عام'),
    ModelKind.coding => const LocalizedText('Coding', 'برمجة'),
    ModelKind.research => const LocalizedText('Research', 'بحث'),
    ModelKind.image => const LocalizedText('Images', 'صور'),
    ModelKind.video => const LocalizedText('Video', 'فيديو'),
    ModelKind.audio => const LocalizedText('Audio', 'صوت'),
    ModelKind.openSource => const LocalizedText('Open models', 'نماذج مفتوحة'),
  };

  IconData get icon => switch (this) {
    ModelKind.general => Icons.auto_awesome_rounded,
    ModelKind.coding => Icons.code_rounded,
    ModelKind.research => Icons.travel_explore_rounded,
    ModelKind.image => Icons.palette_rounded,
    ModelKind.video => Icons.movie_creation_rounded,
    ModelKind.audio => Icons.graphic_eq_rounded,
    ModelKind.openSource => Icons.hub_rounded,
  };
}

class AiModel {
  const AiModel({
    required this.id,
    required this.name,
    required this.maker,
    required this.kind,
    required this.tagline,
    required this.summary,
    required this.benefits,
    required this.bestFor,
    required this.avoid,
    required this.platforms,
    required this.access,
    required this.promptTip,
    required this.accent,
  });

  final String id;
  final String name;
  final String maker;
  final ModelKind kind;
  final LocalizedText tagline;
  final LocalizedText summary;
  final List<LocalizedText> benefits;
  final List<LocalizedText> bestFor;
  final List<LocalizedText> avoid;
  final List<String> platforms;
  final LocalizedText access;
  final LocalizedText promptTip;
  final Color accent;
}

enum PlatformKind { assistant, developer, creative, productivity, openModels }

extension PlatformKindX on PlatformKind {
  LocalizedText get label => switch (this) {
    PlatformKind.assistant => const LocalizedText('Assistants', 'مساعدون'),
    PlatformKind.developer => const LocalizedText('Developer', 'للمطورين'),
    PlatformKind.creative => const LocalizedText('Creative', 'إبداعي'),
    PlatformKind.productivity => const LocalizedText('Productivity', 'إنتاجية'),
    PlatformKind.openModels => const LocalizedText(
      'Open models',
      'نماذج مفتوحة',
    ),
  };
}

class AiPlatform {
  const AiPlatform({
    required this.name,
    required this.company,
    required this.kind,
    required this.description,
    required this.models,
    required this.freeTier,
    required this.access,
    required this.website,
    required this.accent,
  });

  final String name;
  final String company;
  final PlatformKind kind;
  final LocalizedText description;
  final List<String> models;
  final bool freeTier;
  final LocalizedText access;
  final String website;
  final Color accent;
}

class ProblemTemplate {
  const ProblemTemplate({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.examples,
    required this.accent,
  });

  final String id;
  final IconData icon;
  final LocalizedText title;
  final LocalizedText description;
  final List<LocalizedText> examples;
  final Color accent;
}

class UserGoal {
  const UserGoal({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.targetTab,
    required this.accent,
  });

  final IconData icon;
  final LocalizedText title;
  final LocalizedText subtitle;
  final int targetTab;
  final Color accent;
}
