// import 'dart:html';
import 'package:Kamadhenu/Forms/add_animal.dart';
import 'package:Kamadhenu/Forms/create.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String
    species_name; //Used from Buysell.dart to tell which animal is to be fetched
final String image = "cow/H2.jpg";

class Portal extends StatefulWidget {
  State<StatefulWidget> createState() {
    return PortalDisp();
  }
}

final Firestore fb = Firestore.instance;

class PortalDisp extends State<Portal> {
  // Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  //   //Display of Documents
  //   return ListTile(
  //     title: Text(document['Breed']),
  //     isThreeLine: true,
  //     subtitle: Text("Age: " + document['Age'].toString()),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animals For Sell"),
          backgroundColor: Colors.blue.shade900,
        ),
        // body: StreamBuilder(
        //   stream: Firestore.instance //Stream will fetch the documents
        //       .collection('cattles_Demo')
        //       .where('Species', isEqualTo: species_name)
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     //whenever there is an update in database, Snapshot will change here
        //     if (!snapshot.hasData) return const Text("Loading...");
        //     return ListView.builder(
        //       itemCount: snapshot.data.documents.length,
        //       itemBuilder: (context, index) => _buildListItem(
        //           context,
        //           snapshot.data
        //               .documents[index]), //pass index of every fetched document
        //     );
        //   },
        // )
        body: Container(
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: getImages(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                    itemCount: snapshot.data.documents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: Card(
                          color: Colors.blue[50],
                          borderOnForeground: true,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: SingleChildScrollView(
                                child: Image.network(
                                  snapshot.data.documents[index].data["url"],
                                  // fit: BoxFit.scaleDown,
                                  height: 80,
                                  width: 200,
                                ),
                              )),
                              Text(
                                "Price:" +
                                    snapshot
                                        .data.documents[index].data["price"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Breed:" +
                                    snapshot
                                        .data.documents[index].data["Breed"],
                                style: TextStyle(fontStyle: FontStyle.italic),
                                textScaleFactor: 1.5,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("cattlesForSale").getDocuments();
  }
}
