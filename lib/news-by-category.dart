import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var fireInstance = Firestore.instance ;




class ByCategory extends StatelessWidget {

  Widget build(context){
    
//    DocumentReference docRef = fireInstance.collection('news').document('newsbycategory').snapshots() ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todays News'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Category'),
            ),
            StreamBuilder(
              stream: fireInstance.collection('news').document('newsbycategory').collection('cinema').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                print(snapshot.data.documents[0]['title']);
                if(!snapshot.hasData)
                  return Center(
                   child: CircularProgressIndicator(),
                  );
                else
                return ListTile(
                  title: Text('Hi'),
                );
              }
             ),
          ],
        ),
      ),
    );
  }
}