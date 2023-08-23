import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  // Load the .env file from the project root folder
  await dotenv.load();

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
  String _deepLinkText = '';

  @override
  void initState() {
    super.initState();
    _initUniLinks();
  }

  Future<void> _initUniLinks() async {
    try {
      // Attach a listener to the stream
      uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          setState(() {
            // Access query parameters
            if (uri.queryParameters.containsKey('name')) {
              String param1Value = uri.queryParameters['name']!;
              _deepLinkText = 'Welcome Back \n $param1Value';
            }
          });
        }
      });

      // Get the initial URI when the app is opened
      final initialUri = await getInitialUri();
      if (initialUri != null) {
        print(initialUri.queryParameters.isNotEmpty);

        setState(() {
          if (initialUri.queryParameters.containsKey('name')) {
            String param1Value = initialUri.queryParameters['name']!;
            _deepLinkText = 'Welcome Back \n $param1Value';
          }
        });
      }
    } on PlatformException {
      print('Error getting initial URI.');
    }
  }

  void _openDeepLink() {
    // Simulate opening a deep link (for demonstration purposes)
    launchUrl(Uri.parse('myapp://slave'));
  }

  void _openWebLink() async {
    String url = dotenv.env['SERVER_IP']!;

    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deep Link Handling Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _openDeepLink, // Call the method to open the deep link
              child: Text('Redirect to App'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openWebLink, // Call the method to open the deep link
              child: Text('Redirect to Web'),
            ),
            Text(
              _deepLinkText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
