import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavory/core/router/app_routers.dart';
import 'package:flavory/core/theme/app_theme.dart';
import 'package:flavory/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flavory/features/auth/data/sources/firebase_auth_data_source.dart';
import 'package:flavory/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flavory/features/auth/presentation/cubit/auth_form_cubit/auth_form_cubit.dart';
import 'package:flavory/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  AuthBloc(
      repository: AuthRepositoryImpl(
        remote: FirebaseAuthDataSource(FirebaseAuth.instance),
      ),
    )
    ..add(AuthStarted())
    ..stream.listen((_) {
      AppRouters.router.refresh();
    });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            repository: AuthRepositoryImpl(
              remote: FirebaseAuthDataSource(FirebaseAuth.instance),
            ),
          )..add(AuthStarted()),
        ),
        BlocProvider(
          create: (context) => AuthFormCubit(
            repository: AuthRepositoryImpl(
              remote: FirebaseAuthDataSource(FirebaseAuth.instance),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.light,
        routerConfig: AppRouters.router,
      ),
    );
  }
}
