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
                return CircularProgressIndicator();
              else{
                print('inside else');
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      DocumentSnapshot myPost = snapshot.data.documents[index];
                      GlobalKey gk =  GlobalKey();
                      return Container(
                        margin: EdgeInsets.all(15),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children : <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      myPost['title'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child:Image.network(myPost['imageUrl']),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(myPost['description']),
                                  )
                                ],
                              ),
                            ),


                            FloatingActionButton(
                                child: Icon(Icons.star),
                                key: gk,
                                onPressed: (){

                                },

                            ),
                          ],


                        ),
                      );
                       }
                      );
                    }

              }

          ),


      );

  }
}