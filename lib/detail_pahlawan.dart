import 'package:flutter/material.dart';
import 'package:submission/pahlawan.dart';

class DetailPahlawan extends StatelessWidget {
  final Pahlawan pahlawan;

  const DetailPahlawan({Key? key, required this.pahlawan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
          return DetailMobilePage(pahlawan: pahlawan);
      },
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
            Container(
              child: Stack(
                  children: <Widget> [
                    Container(
                        height: 500,
                        width: 500,
                        child: Image.asset(pahlawan.imageAsset, fit: BoxFit.cover)
                    ),
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
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children:[
                  Text(
                    pahlawan.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.blue,
                      ),
                      Text(pahlawan.origin,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                pahlawan.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class DetailWebPage extends StatefulWidget {
//   final Pahlawan pahlawan;
//
//   const DetailWebPage ({Key? key, required this.pahlawan}) : super (key: key);
//
//   @override
//   _DetailWebPage createState() => _DetailWebPage();
// }

// class _DetailWebPage extends State<DetailWebPage>{
//   final _scrollController = ScrollController();
//
//   // @override
//   // Widget build (BuildContext context){
//   //   final screenWidth = MediaQuery.of(context).size.width;
//   //
//   //
//   // }
// }


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

