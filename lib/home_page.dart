import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String input = "";
    String url = "https://www.youtube.com/watch?v=";
    _launchurl() async {
      if (await canLaunch(url)) {
        await launch(url + input);
      } else {
        throw "could not launch url";
      }
    }

    final tokeCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Url search',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Center(
              child: TextFormField(
                controller: tokeCon,
                decoration: const InputDecoration(
                    labelText: 'Enter your video link', hintText: 'Enter url'),
                onChanged: (value) {
                  input = value;
                },
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              _launchurl();
            },
            child: Text('search'),
          )
        ],
      ),
    );
  }
}
