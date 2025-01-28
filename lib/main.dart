import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notify_app/services/notes_service.dart';
import 'package:notify_app/views/note_list.dart';


void setupServiceLocator() {
  GetIt.I.registerLazySingleton<NotesService>(() => NotesService());
}

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NoteList(),
    );
  }
}