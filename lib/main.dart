import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'repositories/photo_repository.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/photos/photos_bloc.dart';
import 'screens/login_screen.dart';

void main() {
  final photoRepo = PhotoRepository(client: http.Client());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => PhotosBloc(photoRepo)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
