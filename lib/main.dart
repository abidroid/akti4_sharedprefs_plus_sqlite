import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter Demo'),
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
  // initial state of the counter
  int _counter = 50;

  void _counterKiIzafaOka() async {

    _counter++;

    // save the counter value in shared preferences
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    // writing - saving the counter value
    await asyncPrefs.setInt('SHMERA', _counter);


    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();

    readShmeraValueFromSharedPreferences();
  }

  readShmeraValueFromSharedPreferences() async {

    // it will read the stored SHMERA value from SharedPreferences
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int? storedValue = await asyncPrefs.getInt('SHMERA');

    await Future.delayed(Duration(seconds: 3));

    if (storedValue != null) {
      setState(() {
        _counter = storedValue;
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'Counter Count',
              style: Theme.of(context).textTheme.headlineLarge,

            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterKiIzafaOka, // function
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
