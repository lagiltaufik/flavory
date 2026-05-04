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

  final authRepository = AuthRepositoryImpl(
    remote: FirebaseAuthDataSource(FirebaseAuth.instance),
  );

  final authBloc = AuthBloc(repository: authRepository)..add(AuthStarted());

  authBloc.stream.listen((_) {
    AppRouters.router.refresh();
  });
  runApp(
    MyApp(
      authBloc: authBloc,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;
  const MyApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
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
