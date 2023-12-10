import 'dart:convert';
import 'package:flutter/material.dart';
import 'quote_expand_screen.dart';
import 'package:http/http.dart' as http;



class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  // const mainScreen({super.key});
  final String postsURL = "http://api.quotable.io/random";

  String? quote = "";
  String? author = "";

  generateQuote() async{
      var res = await http.get(Uri.parse(postsURL));
      var result = jsonDecode(res.body);

      setState(() {
        quote = result['content'];
        author = result['author'];
      });

  }

  @override
  void initState() {
    super.initState();
    generateQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes of the Day',
            style: TextStyle(
              color: Colors.black
            ),
          textAlign: TextAlign.right,
        ),
            backgroundColor: Colors.white,
        elevation: 0,
      ),
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:[
                    Text(
                      '"$quote"',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),

                  Text(
                        '-$author',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                    textAlign: TextAlign.left,
                      ),
                  ]
                ),
          ),

    bottomNavigationBar: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: generateQuote,
            icon: Icon(Icons.home)),
        IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (Context) =>quotes())
              );
            },
            icon: Icon(Icons.format_quote)),
      ],
    ),
    );
  }
}
