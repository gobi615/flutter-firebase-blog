import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    String arg = ModalRoute.of(context).settings.arguments;
    String category = arg != null ? arg : 'business' ;

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: <Widget>[
            FlatButton(
              child: Text('Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Category'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text('Business'),
              leading: Icon(Icons.business),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'business');
              },
            ),
            ListTile(
              title: Text('Cinema'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'cinema');
              },
            ),
            ListTile(
              title: Text('Environment'),
              leading: Icon(FontAwesomeIcons.globe),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'environment');
              },
            ),
            ListTile(
              title: Text('LifeStyle'),
              leading: Icon(FontAwesomeIcons.female),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'lifestyle');
              },
            ),
            ListTile(
              title: Text('Nation'),
              leading: Icon(FontAwesomeIcons.flag),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'nation');
              },
            ),
            ListTile(
              title: Text('Space'),
              leading: Icon(FontAwesomeIcons.spaceShuttle),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'space');
              },
            ),
            ListTile(
              title: Text('State'),
              leading: Icon(Icons.account_balance),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'tamilnadu');
              },
            ),
            ListTile(
              title: Text('Sports'),
              leading: Icon(FontAwesomeIcons.trophy),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'sports');
              },
            ),
            ListTile(
              title: Text('Tech'),
              leading: Icon(FontAwesomeIcons.slideshare),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'tech');
              },
            ),
            ListTile(
              title: Text('World'),
              leading: Icon(FontAwesomeIcons.globeAsia),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/bycategory', arguments: 'world');
              },
            ),

          ],
        ),
      ),
      body: NewsByCategory(category),
    );
  }
}

class NewsByCategory extends StatelessWidget{

  String category ;
  NewsByCategory(this.category);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: fireStore.collection('news').document('newsbycategory').collection(category).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              print(snapshot.data.documents.length);
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
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          }
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },

    );
  }

}

