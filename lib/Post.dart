import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String docId;
  String title;
  String imageUrl;
  String description;

  Map fireObj = Map();

  Post({this.docId,this.title, this.imageUrl, this.description});

 factory Post.fromMap(DocumentSnapshot fireObj){
    return Post(
      docId: fireObj.documentID,
      title :fireObj['title'],
      imageUrl : fireObj['imageUrl'],
      description: fireObj['description']
    );

  }

  Post.toMap(){
    fireObj['title'] = title;
    fireObj['imageUrl'] = title;
    fireObj['description'] = title;
  }

}
