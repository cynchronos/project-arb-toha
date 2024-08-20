import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/pages/base_page.dart';
import 'package:ui/providers/delete_provider.dart';
import 'package:ui/providers/kategori_provider.dart';
import 'package:ui/providers/material_dropdown_provider.dart';
import 'package:ui/providers/material_provider.dart';
import 'package:ui/providers/pages_provider.dart';
import 'package:ui/providers/sub_kategori_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MaterialProvider()),
        ChangeNotifierProvider(create: (context) => KategoriProvider()),
        ChangeNotifierProvider(create: (context) => SubKategoriProvider()),
        ChangeNotifierProvider(create: (context) => PagesProvider()),
        ChangeNotifierProvider(create: (context) => DeleteProvider()),
        ChangeNotifierProvider(create: (context) => MaterialDropdownProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BasePage(),
      ),
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
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
