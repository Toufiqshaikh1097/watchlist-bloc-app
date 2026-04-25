import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/market/market_bloc.dart';
import 'logic/navigation/navigation_bloc.dart';
import 'logic/watchlist/watchlist_bloc.dart';
import 'presentation/screens/watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WatchlistBloc()),
          BlocProvider(create: (_) => NavigationBloc()),
          BlocProvider(create: (_) => MarketBloc())
        ],
        child: const WatchlistScreen(),
      ),
    );
  }
}