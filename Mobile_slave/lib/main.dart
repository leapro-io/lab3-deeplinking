import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
     uriLinkStream.listen((Uri? uri){});
  }



  void _openDeepLink() async {
    String text = textEditingController.text;
    launchUrl(Uri.parse('myapp://master/page1?name=${Uri.encodeComponent(text)}'));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text ("Please Enter your Name"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _openDeepLink,
              child: Text('Go back to app'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
