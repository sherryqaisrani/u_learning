import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/app_bloc.dart';
import 'package:u_learning/app_events.dart';
import 'package:u_learning/app_states.dart';
import 'package:u_learning/pages/signin/signin_page.dart';
import 'package:u_learning/pages/welcome/blocs/welcome_bloc.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            initialRoute: '/',
            routes: {
              "/": (context) => const WelcomePage(),
              "/homePageRoute": (context) => const MyHomePage(
                    title: 'Futter Demo',
                  ),

              "/signingPageRoute":(context) => const SigninPage(),
            },
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0
              ),
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        // child: WelcomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<AppBloc, AppStates>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${BlocProvider.of<AppBloc>(context).state.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<AppBloc>(context).add(IncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<AppBloc>(context).add(DecrementEvent()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
