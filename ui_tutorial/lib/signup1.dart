import 'package:flutter/material.dart';

class SignUpOne extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body : ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
               Container(
//                 width: double.infinity,
                 height: MediaQuery.of(context).size.height,
                 color: Colors.blueAccent,
               ),
               Container(
                 height: MediaQuery.of(context).size.height,
                 child: Align(
                   alignment: Alignment.center,
                   child:
                   Container(
                     margin: EdgeInsets.all(16),
                     height: 300,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.white
                     ),
//                  margin: EdgeInsets.all(16),
//                  padding: EdgeInsets.all(16),
//                  color: Colors.white,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Padding(
                           padding: EdgeInsets.all(16),
                           child: TextField(

                             decoration: InputDecoration(
                               prefixIcon: Icon(Icons.email),
                               hintText: 'Email address',
//                            border: InputBorder.none
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(5.0)
//                          )
                             ),
                           ),
                         ),

                         Padding(
                           padding: EdgeInsets.all(16),
                           child: TextField(
                             decoration: InputDecoration(
                               prefixIcon: Icon(Icons.lock),
                               hintText: 'Password',
//                          border: InputBorder.none
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(5.0)
//                          )
                             ),
                           ),
                         ),

                         Padding(
                           padding: EdgeInsets.all(16),
                           child: TextField(
                             decoration: InputDecoration(
                               prefixIcon: Icon(Icons.lock),
                               hintText: 'Password',
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(5.0)
//                          )
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),

                 ),
               ),





               Container(
                 height: MediaQuery.of(context).size.height *.718,
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child:  RaisedButton(
                     color: Colors.lightBlueAccent,
                     onPressed: (){},
                     child: Text('Signup',),
                     shape: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0)
                     ),
                   ),
                 ),
               ),

              ],
            ),
          ],
        )


    );
  }


}