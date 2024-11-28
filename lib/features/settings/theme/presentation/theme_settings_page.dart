import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_flutter/core/presentation/styles/themes/app_theme.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/buttons/button_builder.dart';
import 'package:pixabay_flutter/features/settings/core/presentation/blocs/global_settings_bloc.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

@RoutePage()
class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({super.key});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSettingsBloc, GlobalSettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.colors.window.background,
          appBar: AppBar(
            backgroundColor: context.theme.colors.window.background,
            title: Text(
              S.of(context).theme,
              style: context.theme.texts.title2.medium.copyWith(color: context.theme.colors.texts.text1),
            ),
            centerTitle: true,
            leading: ButtonBuilders.back(
              onTap: () => context.router.maybePop(),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final themeType = ThemeType.values[index];

                    final theme = getTheme(themeType).extension<AppTheme>()!;
                    final selected = state.type == themeType;

                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          context.read<GlobalSettingsBloc>().add(GlobalSettingsEvent.updatedTheme(type: themeType));
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                color: theme.colors.window.background,
                                border: Border.all(
                                  color: theme.colors.menu.divider,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Transform.translate(
                                offset: const Offset(2, 2),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30, top: 30),
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  decoration: BoxDecoration(
                                    color: theme.colors.menu.background,
                                    border: Border.all(
                                      color: theme.colors.menu.divider,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                  ),
                                  child: Text(
                                    "Aa",
                                    style: theme.texts.body2.medium.copyWith(
                                      color: theme.colors.texts.text1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 0),
                                  opacity: selected ? 1 : 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.check_circle, color: theme.colors.texts.text1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: ThemeType.values.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
