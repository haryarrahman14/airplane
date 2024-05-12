import "package:airplane/cubit/auth_cubit.dart";
import "package:airplane/cubit/destination_cubit.dart";
import "package:airplane/cubit/page_cubit.dart";
import "package:airplane/cubit/seat_cubit.dart";
import "package:airplane/cubit/transaction_cubit.dart";
import "package:airplane/ui/pages/bonus_page.dart";
import "package:airplane/ui/pages/get_started_page.dart";
import "package:airplane/ui/pages/main_page.dart";
import "package:airplane/ui/pages/sign_in_page.dart";
import "package:airplane/ui/pages/sign_up_page.dart";
import "package:airplane/ui/pages/splash_page.dart";
import "package:airplane/ui/pages/success_checkout_page.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:airplane/extension/extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  String apiKey = dotenv.get("API_KEY");
  String appId = dotenv.get('APP_ID');
  String msgId = dotenv.get('MSG_ID');
  String projectId = dotenv.get('PROJECT_ID');

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: msgId,
      projectId: projectId,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
