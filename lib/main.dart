import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/data/di/dependency_container.dart';
import 'package:pixabay_flutter/core/presentation/routes/app_router.dart';
import 'package:pixabay_flutter/core/presentation/styles/themes/app_theme.dart';
import 'package:pixabay_flutter/features/settings/core/presentation/blocs/global_settings_bloc.dart';
import 'package:pixabay_flutter/gen/assets.gen.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: Assets.aEnv);
  await resolveDependencies(environment: Environment.prod);

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final globalAppRouter = AppRouter(navigatorKey: navigatorKey);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<GlobalSettingsBloc>()..add(const GlobalSettingsEvent.init())),
      ],
      child: BlocBuilder<GlobalSettingsBloc, GlobalSettingsState>(
        builder: (context, state) {
          final themeType = state.type;

          return MaterialApp.router(
            theme: getTheme(themeType),
            themeMode: getThemeMode(themeType),
            locale: Locale(state.language),
            debugShowCheckedModeBanner: false,
            routerConfig: globalAppRouter.config(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            builder: (context, child) {
              return child ?? const SizedBox();
            },
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
