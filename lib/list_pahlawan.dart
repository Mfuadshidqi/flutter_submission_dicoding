import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:submission/pahlawan.dart';
import 'detail_pahlawan.dart';

class ListPahlawan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pahlawan'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const PahlawanList();
          } else if (constraints.maxWidth <= 1200) {
            return PahlawanGrid(gridCount: 4);
          } else {
            return PahlawanGrid(gridCount: 6);
          }
        },
      ),
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
                      return DetailPahlawan(pahlawan: listPahlawan);
                  }));
                },
              child: Card(
                elevation: 2,
                borderOnForeground: true,
                child: Row (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(listPahlawan.imageAsset),
                          ),
                          title: Text(listPahlawan.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          subtitle: Text(listPahlawan.origin, style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic))
                        )
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: PahlawanListData.length
      ),
    );
  }
}

class PahlawanGrid extends StatelessWidget {
  final int gridCount;

  PahlawanGrid({required this.gridCount});

  @override
  Widget build(BuildContext context){
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: PahlawanListData.map((pahlawan){
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPahlawan(pahlawan: pahlawan);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        pahlawan.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        pahlawan.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        pahlawan.origin,
                      ),
                    ),
                  ],
                ),

              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}