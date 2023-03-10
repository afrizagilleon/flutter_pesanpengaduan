
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laporan_masyarakat/widgets/table_header_admin_listuser.dart';
import 'package:http/http.dart' as http;

import '../constants/contant.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  Future fetchPost() async {
    final response =
    await http.post(Uri.parse('${Constant.apiUsersAll}'));
    return jsonDecode(response.body);
  }

  List<dynamic> _post = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchPost().then((value) =>
        setState(()=>{
          if(_post != null){
            _post = value,
            // print(value)
          }
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    int ? i =0 ;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Daftar Report', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20),),
          const Gap(12),
          const Text('   Semua akun user ada di sini'),
          const Gap(12),
          Container(
            child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                },
                border: TableBorder.all(),
                children:  <TableRow>[
                  const TableRow(
                      children: [
                        TableCell(child: Padding(

                          padding: EdgeInsets.all(8.0),
                          child: Text('No', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('ID User', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Username', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Password', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Phone', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Level', textAlign: TextAlign.center,),
                        )),
                      ]
                  ),

                  for (int i = 0; i < (_post.length); i++)
                    TableHeaderAdminListUser().
                    gett(i+1,
                        _post[i]['id_user'].toString(),
                        _post[i]['username'],
                        _post[i]['password'],
                        _post[i]['phone'],
                        _post[i]['level']
                    )
                ]

            ),
          )
        ],
      ),
    );
  }
}
