
import 'package:flutter/cupertino.dart';

class TableHeader{

  gett( int noo, String report, String datetime){
    int no = noo;
    return TableRow(
        children: [
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text( no.toString(), textAlign: TextAlign.center,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(report, textAlign: TextAlign.left,),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(datetime, textAlign: TextAlign.center,),
          )),
        ]
    );
  }
}