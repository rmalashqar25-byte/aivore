import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../core/localized_text.dart';
import '../widgets/common.dart';
import 'models_screen.dart';
import 'platforms_screen.dart';
import 'prompt_lab_screen.dart';
import 'start_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.language,
    required this.onToggleLanguage,
  });

  final AppLanguage language;
  final VoidCallback onToggleLanguage;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      StartScreen(language: widget.language, onChooseGoal: _selectTab),
      ModelsScreen(language: widget.language),
      PlatformsScreen(language: widget.language),
      PromptLabScreen(language: widget.language),
    ];

    return Scaffold(
      body: Stack(
        children: [
          const _Atmosphere(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= 840;
                final content = IndexedStack(
                  index: _selectedIndex,
                  children: pages,
                );

                if (wide) {
                  return Column(
                    children: [
                      TopBar(
                        language: widget.language,
                        onToggleLanguage: widget.onToggleLanguage,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 6, 16),
                              child: NavigationRail(
                                backgroundColor: AppColors.panel.withValues(
                                  alpha: 0.92,
                                ),
                                indicatorColor: AppColors.violet.withValues(
                                  alpha: 0.2,
                                ),
                                selectedIndex: _selectedIndex,
                                onDestinationSelected: _selectTab,
                                labelType: NavigationRailLabelType.all,
                                groupAlignment: 0,
                                destinations: _railDestinations(
                                  widget.language,
                                ),
                              ),
                            ),
                            Expanded(child: content),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    TopBar(
                      language: widget.language,
                      onToggleLanguage: widget.onToggleLanguage,
                    ),
                    Expanded(child: content),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MediaQuery.sizeOf(context).width < 840
          ? NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _selectTab,
              destinations: _bottomDestinations(widget.language),
            )
          : null,
    );
  }
}

List<NavigationDestination> _bottomDestinations(AppLanguage language) {
  return [
    NavigationDestination(
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home_rounded),
      label: LocalizedText('Start', 'البداية').resolve(language),
    ),
    NavigationDestination(
      icon: const Icon(Icons.memory_outlined),
      selectedIcon: const Icon(Icons.memory_rounded),
      label: LocalizedText('Models', 'النماذج').resolve(language),
    ),
    NavigationDestination(
      icon: const Icon(Icons.apps_outlined),
      selectedIcon: const Icon(Icons.apps_rounded),
      label: LocalizedText('Platforms', 'المنصات').resolve(language),
    ),
    NavigationDestination(
      icon: const Icon(Icons.auto_fix_high_outlined),
      selectedIcon: const Icon(Icons.auto_fix_high_rounded),
      label: LocalizedText('Prompt Lab', 'مختبر الطلبات').resolve(language),
    ),
  ];
}

List<NavigationRailDestination> _railDestinations(AppLanguage language) {
  return _bottomDestinations(language)
      .map(
        (item) => NavigationRailDestination(
          icon: item.icon,
          selectedIcon: item.selectedIcon,
          label: Text(item.label),
        ),
      )
      .toList();
}

class _Atmosphere extends StatelessWidget {
  const _Atmosphere();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -160,
            right: -120,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.violet.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -190,
            left: -140,
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.cyan.withValues(alpha: 0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
