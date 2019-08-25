
import 'package:flutter/material.dart';
import 'auth.dart';


class Provider extends InheritedWidget{

  final BaseAuth auth ;

  Provider({Key key, this.auth, Widget child, }) : super(key : key, child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider);
  }


}