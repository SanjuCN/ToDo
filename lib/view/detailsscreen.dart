import 'package:flutter/material.dart';
import 'package:title/model/model.dart';

class Details extends StatelessWidget {
  const Details({super.key,required this.title,required this.description,required this.date,required this.index}
  );
  final String title;
  final String description;
  final  date;
  final index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  noteModel[index].title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(noteModel[index].date)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              noteModel[index].description,
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
