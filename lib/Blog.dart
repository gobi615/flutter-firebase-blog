import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var fireStore = Firestore.instance;

class Blog extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: StreamBuilder(
          stream: fireStore.collection('post').snapshots(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child : CircularProgressIndicator(),
                );
            else {
              print('inside else');
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myPost = snapshot.data.documents[index];
                    GlobalKey gk = GlobalKey();
                    return Stack(
                      children: <Widget>[
                        Column(children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width,
//                              height: 350,
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Material(
                                      color: Colors.white,
                                      elevation: 16.0,
                                      shadowColor: Color(0x802196F3),
                                      child: Center(
                                          child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size
                                                  .width,
                                              height: 200.0,
                                              child: Image.network(
                                                  '${myPost['imageUrl']}',
                                                  fit: BoxFit.fill),
                                            ),
                                            SizedBox(height: 16.0),
                                            Text(
                                              '${myPost['title']}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              '${myPost['description']}',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey),
                                            ),
                                        ]),
                                      ))))),
                        ]),
                        Container(
                          alignment: Alignment.bottomRight,
//                          padding: EdgeInsets.only(
//                            top: MediaQuery.of(context).size.height * .15,
//                            left: MediaQuery.of(context).size.height * .05,
//                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width *.15,
                              child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.star,
                                      color: Colors.white, size: 20.0))),
                        ),

                      ],
                    );
                  });
            }
          }),
    );
  }
}
