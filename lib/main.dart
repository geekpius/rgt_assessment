import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rgt_assessment/core/observer/app_bloc_observer.dart';

import 'core/routes/app_navigator.dart';
import 'core/routes/app_routes.dart';
import 'core/services/service_locator.dart';
import 'src/features/dashboard/presentation/cubit/dashboard_cubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setUpGetItServiceLocator();
  Bloc.observer = const AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoute.home,
        onGenerateRoute: AppNavigator.generateRoute,
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
