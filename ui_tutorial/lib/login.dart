import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginOne extends StatelessWidget{

  Widget build(context){
    return Scaffold(
      body: SafeArea(child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                SizedBox(height: 10,),
                Spacer(),
                Text('existing members', style: TextStyle(
                  color: Colors.white,
                ),),
                SizedBox(height: 10,),
//                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text('Login',
                      style: TextStyle(
                        color: Colors.red,
                      ),),
                  ),
                ),
                Spacer(flex: 1,),
              ],
            ),
          ),
         Expanded(
           child : Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Spacer(flex: 1,),
//                SizedBox(height : 10),
                Text('or If your new here'),
                SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: EdgeInsets.all(16),
                    onPressed: () {},
                    color: Colors.red,
                    child: Text('SignUp',
                      style: TextStyle(
                        color: Colors.white,
                      ),)        ,
                  ),
                ),
                SizedBox(height : 10),
                Text('or continue with'),
                SizedBox(height : 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.google),
                          SizedBox(width : 10),
                          Text('Google',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        ],
                      ),

                    ),
                    SizedBox(width : 15),
                    RaisedButton(
                      color: Colors.indigo,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.facebook),
                          SizedBox(width : 10),
                          Text('Facebok',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        ],
                      ),
                    ),

                  ],
                ),
                Spacer(flex: 2,),
              ],
            ),
          ),),

        ],
      ))
    );
  }
}