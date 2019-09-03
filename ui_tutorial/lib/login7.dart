import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSeven extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child : ListView(
          children: <Widget> [
//            true ? { print('size.height ${MediaQuery.of(context).size.width} ') , Container()} : Container(),

            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClip1(),
                  child: Container(
//                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                  ),
                ),


                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .45,
//                  color: Colors.pinkAccent,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.hamburger),
                      Text('Taste Me', style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),

              ],
            ),


            Container(
              width: double.infinity,
//            height: MediaQuery.of(context).size.height * .45,
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                 Material(
                   elevation: 2.0,
                   borderRadius: BorderRadius.all(Radius.circular(30)),
                   child:  TextField(
                     onChanged: (String value){
                     },
                     keyboardType: TextInputType.emailAddress,
                     decoration: InputDecoration(
                         prefixIcon: Icon(FontAwesomeIcons.envelope),
                         hintText: 'email',
                         border: InputBorder.none
                     ),
                   ),
                 ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (String value){
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.lock),
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text('Forget Password ?',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                  SizedBox(height: 55),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Dont\' have an account ? ',),
                      Text('Sign Up ',
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline
                        ),),
                    ],
                  ),

                ],
              ),
            ),


          ],
         ),),

    );
  }
}

class WaveClip1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);
    print('size.height ${size.height} ');
    print('size.width ${size.width} ');

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;
  }

}
