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

    );
  }
}