import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/routes/app_router.gr.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/buttons/button_builder.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

@RoutePage()
class SettingsDashboardPage extends StatefulWidget {
  const SettingsDashboardPage({super.key});

  @override
  State<SettingsDashboardPage> createState() => _SettingsDashboardPageState();
}

class _SettingsDashboardPageState extends State<SettingsDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: context.theme.texts.title3.medium.copyWith(
            color: context.theme.colors.texts.text1,
          ),
        ),
        leading: ButtonBuilders.back(
          onTap: () => context.router.maybePop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ButtonBuilders.base(
              onTap: () => context.router.push(const ThemeSettingsRoute()),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: context.theme.colors.buttons.background2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.track_changes_sharp, color: context.theme.colors.texts.text5),
                    const SizedBox(width: 10),
                    Text(
                      S.of(context).theme,
                      style: context.theme.texts.body1.medium.copyWith(
                        color: context.theme.colors.texts.text1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ButtonBuilders.base(
              onTap: () => context.router.push(const LanguageSettingsRoute()),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: context.theme.colors.buttons.background2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.language, color: context.theme.colors.texts.text5),
                    const SizedBox(width: 10),
                    Text(
                      S.of(context).language,
                      style: context.theme.texts.body1.medium.copyWith(
                        color: context.theme.colors.texts.text1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Text(
                "Pixabay Challenge 2024",
                style: context.theme.texts.caption1.medium.copyWith(
                  color: context.theme.colors.texts.text1,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
