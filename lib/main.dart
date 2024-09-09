import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/data/repository/fb_todo_repo.dart';
import 'package:todo/data/repository/isar_todo_repo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/presentation/todo_page.dart';
import 'firebase_options.dart';
import 'data/repository/pb_todo_repo.dart';
import 'presentation/todo_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  //get the directory to store the app
  final dir = await getApplicationDocumentsDirectory();

  // open isar db
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);

  // initialize the repo with isar db
  final isarTodoRepo = IsarTodoRepo(db: isar);

  // pocket initialization
  PocketBase pocketBase =
      PocketBase('https://9e2b-102-89-46-241.ngrok-free.app');

  PocketbaseTodoRepo pocketbaseTodoRepo =
      PocketbaseTodoRepo(pocketBase: pocketBase);

  // FIrebase firestore initialization
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseTodoRepo firebaseTodoRepo =
      FirebaseTodoRepo(firebaseFirestore: firebaseFirestore);

  runApp(MyApp(dbRepos: [
    isarTodoRepo,
    firebaseTodoRepo,
    pocketbaseTodoRepo,
  ]));
}

class MyApp extends StatelessWidget {
  final List<TodoRepo> dbRepos;
  const MyApp({super.key, required this.dbRepos});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(dbRepos.first)..loadTodo(),
        child: TodoPage(dbRepos: dbRepos),
      ),
    );
  }
}
