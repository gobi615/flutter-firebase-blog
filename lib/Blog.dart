import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var fireStore = Firestore.instance ;

class Blog extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: StreamBuilder(
            stream: fireStore.collection('post').snapshots(),
            builder: (BuildContext context, snapshot){
              if(!snapshot.hasData)
                return Container();
              else{
                print('inside else');
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      DocumentSnapshot myPost = snapshot.data.documents[index];
                      return Stack(
                        children: <Widget>[
                          Column(
                            children : <Widget>[
                              Image.network(myPost['imageUrl']),
                              Text(myPost['title']),
                              Text(myPost['description']),
                            ],


                          ),
                        ],
                      );



                       }
                      );
                    }

              }

          ),


      );

  }
}