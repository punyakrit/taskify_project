import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title, description;

  const Description({Key? key, required this.title, required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description'),
       backgroundColor: Colors.deepOrange.withOpacity(0.8),),
      body: Container(
      padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Container(decoration: BoxDecoration(),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    description,
                    style: TextStyle(
                    fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
