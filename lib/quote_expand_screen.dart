import 'package:flutter/material.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class quotes extends StatefulWidget {
  @override
  State<quotes> createState() => _quotesState();
}

class _quotesState extends State<quotes> {
  // const quotes({super.key});
  final String postsURL = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json";

  List<dynamic> qoute_list = [];

  quoteGenartor() async{

    //Getting the data from API
    var response = await http.get(Uri.parse(postsURL));
    var result = jsonDecode(response.body);
    setState(() {
      qoute_list = result['data'] as List;
    });
  }

  @override
  void initState() {
    super.initState();
    quoteGenartor();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quotes',
          style: TextStyle(
              color: Colors.black

          ),
          textAlign: TextAlign.right,
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: qoute_list.length,
          itemBuilder: (context,index) {
            return
              ListTile(

                title: Column(
                  children: [
                    Image.network(
                        qoute_list[index]['image']['small']
                    ),
                    Text(
                      qoute_list[index]['title'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    Row(
                      children: [
                        Text(
                          '-',
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          qoute_list[index]['description'],
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),

                    SizedBox(height: 30,)
                  ],
                ));

          }),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (Context) =>mainScreen())
            );
          },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.format_quote_rounded)),
        ],
      ),
    );
  }
}
