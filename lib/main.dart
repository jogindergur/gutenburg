import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:gutenburg/pages/genres.dart';
import 'controllers/book_controller.dart';

void main() {
  Get.put(BooksController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gutenburg',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Genres(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GenreCard(genreData: genreList[1]),
//             const Text(
//               'You have pushed.',
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.headline1,
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.headline2,
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.genreCard,
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.body,
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.bookName,
//             ),
//             const Text(
//               'You have pushed.',
//               style: Styles.bookAuthor,
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }
