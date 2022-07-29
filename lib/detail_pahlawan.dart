import 'package:flutter/material.dart';
import 'package:submission/pahlawan.dart';

class DetailPahlawan extends StatelessWidget {
  final Pahlawan pahlawan;

  const DetailPahlawan({Key? key, required this.pahlawan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pahlawan'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Detail Pahlawan',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Pahlawan pahlawan;

  const DetailMobilePage({Key? key, required this.pahlawan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget> [
                Image.asset(pahlawan.imageAsset),
                SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          BookmarkButton(),
                        ],
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BookmarkButton extends StatefulWidget{
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton>{
  bool isMarked = false;

  @override
  Widget build(BuildContext context){
    return IconButton(
        onPressed: (){
          setState((){
            isMarked = !isMarked;
          });
    }, icon: Icon(
      isMarked ? Icons.bookmark : Icons.bookmark_border,
      color: Colors.amber,
    ),
    );
  }
}

