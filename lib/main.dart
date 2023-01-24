import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => Favorites(),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('What, ${Provider.of<Favorites>(context).message}'),
        ),
        body: Center(
          child: Column(
            children: const [
              SizedBox(height: 10),
              ButtonChagenge(message: 'is happening'),
              SizedBox(height: 10),
              ButtonChagenge(message: 'is that'),
              SizedBox(height: 10),
              ButtonChagenge(message: 'is going on'),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonChagenge extends StatelessWidget {
  final String message;
  const ButtonChagenge({required this.message});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Favorites>(context, listen: false).changeMessage(message);
      },
      child: Text(message),
    );
  }
}

class Favorites extends ChangeNotifier {
  String message = 'i ...';

  void changeMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }
}
