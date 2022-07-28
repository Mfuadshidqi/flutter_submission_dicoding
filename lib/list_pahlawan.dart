import 'package:flutter/material.dart';
import 'package:submission/pahlawan.dart';

import 'detail_pahlawan.dart';

class ListPahlawan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pahlawan'),
      ),
      // body: LayoutBuilder(
      //     builder: (BuildContext context, BoxConstraints constraints) {
      //   if (constraints.maxWidth <= 600) {
      //     return const TourismPlaceList();
      //   } else if (constraints.maxWidth <= 1200) {
      //     return TourismPlaceGrid(gridCount: 4);
      //   } else {
      //     return TourismPlaceGrid(gridCount: 6);
      //   }
      // }),
    );
  }
}

class PahlawanList extends StatelessWidget {
  const PahlawanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:ListView.builder(
          itemBuilder: (context, index){
            final Pahlawan listPahlawan = PahlawanListData[index];
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailPahlawan();
                  }));
                },
              child: Card(
                child: Row (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(listPahlawan.imageAsset)
                  ],
                ),
              ),

            );
          }
      )
    );
  }
}