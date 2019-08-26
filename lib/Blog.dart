import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Post.dart';

var fireStore = Firestore.instance;

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child : Text(post.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontFamily: 'Merriweather',
              ),
            ),

          ),
          
        ],
      ),
    );
  }
}

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
                child: CircularProgressIndicator(),
              );
            else {
              print('inside else');
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myPost = snapshot.data.documents[index];
                    Post post = Post.fromMap(myPost);
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
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.pushNamed(context, '/article',
                                              arguments: post);
                                        },
                                        child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(children: <Widget>[
                                                Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  height: 200.0,
                                                  child: Image.network(
                                                      '${post.imageUrl}',
                                                      fit: BoxFit.fill),
                                                ),
                                                SizedBox(height: 16.0),
                                                Text(
                                                  '${post.title}',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight
                                                          .bold),
                                                  maxLines: 1,
                                                ),
                                                SizedBox(height: 10.0),
                                                Text(
                                                  '${post.description}',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                  maxLines: 5,
                                                ),
                                              ]),
                                            )),
                                      )
                                  ))),
                        ]),
                      ],
                    );
                  });
            }
          }),
    );
  }
}

