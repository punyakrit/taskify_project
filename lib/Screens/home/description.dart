import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title, description;

  const Description({required Key key, required this.title, required this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                title,
                ),
              ),
            
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                description,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}