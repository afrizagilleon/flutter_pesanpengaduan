
import 'package:flutter/cupertino.dart';

class TableHeaderAdminListUser{

  gett( int noo, String id_user, String username, String password ,String phone, String level){
    int no = noo;
    return TableRow(
        children: [
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( no.toString(), textAlign: TextAlign.center,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text( id_user.toString(), textAlign: TextAlign.center),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( username, textAlign: TextAlign.center,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( password, textAlign: TextAlign.center,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( phone, textAlign: TextAlign.center,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( level, textAlign: TextAlign.center,),
          ))
        ]
    );
  }
}