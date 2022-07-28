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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
            return PahlawanList();
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
                      return DetailPahlawan();
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