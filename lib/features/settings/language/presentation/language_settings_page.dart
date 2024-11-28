import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/ripple_widget.dart';
import 'package:pixabay_flutter/features/settings/core/presentation/blocs/global_settings_bloc.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

import '../../../../core/presentation/widgets/buttons/button_builder.dart';

final List<LanguageItem> languages = [
  (title: "English", code: "en"),
  (title: "Polski", code: "pl"),
];

@RoutePage()
class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

typedef LanguageItem = ({String title, String code});

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSettingsBloc, GlobalSettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.colors.window.background,
          appBar: AppBar(
            backgroundColor: context.theme.colors.window.background,
            title: Text(
              S.of(context).language,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.colors.menu.background,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final language = languages[index];
                        final selected = state.language == language.code;

                        return RippleWidget(
                          onTap: () {
                            context
                                .read<GlobalSettingsBloc>()
                                .add(GlobalSettingsEvent.updatedLanguage(language: language.code));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      language.title,
                                      style: context.theme.texts.body2.medium.copyWith(
                                        color: context.theme.colors.texts.text1,
                                      ),
                                    ),
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selected
                                              ? context.theme.colors.texts.text1
                                              : context.theme.colors.texts.text3,
                                          width: selected ? 5 : 1,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              if (index != languages.length - 1)
                                Divider(height: 1, thickness: 1, color: context.theme.colors.menu.divider)
                            ],
                          ),
                        );
                      },
                      itemCount: languages.length,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
