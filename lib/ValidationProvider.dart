
import 'package:flutter/material.dart';
import 'ValidationBloc.dart';
import 'auth.dart';


class ValidProvider extends InheritedWidget{

  final BaseValidation valid;

  ValidProvider({Key key, this.valid, Widget child, }) : super(key : key, child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static ValidProvider of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(ValidProvider) as ValidProvider);
  }


}