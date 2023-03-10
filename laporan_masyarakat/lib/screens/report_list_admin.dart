import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:laporan_masyarakat/widgets/table_header_admin.dart';
import 'package:provider/provider.dart';

import '../constants/contant.dart';
import '../providers/auth_provider.dart';
import '../widgets/table_header.dart';

class ReportListAdmin extends StatefulWidget {
  const ReportListAdmin({Key? key}) : super(key: key);

  @override
  State<ReportListAdmin> createState() => _ReportListAdminState();
}

class _ReportListAdminState extends State<ReportListAdmin> {

  Future fetchPost() async {
    final response =
    await http.post(Uri.parse('${Constant.apiReportListAll}'));

    // if(jsonDecode(response.body)['username'] != null){
    //   final parsed = jsonDecode(response.body);
    //   // return {'ok' : 'oke', 'parsed' : parsed};
    //   // print(parsed);
    //   return parsed;
    // }
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
          const Text('   Semua pesan dan laporan yang disampaikan masyarakat ada di sini'),
          const Gap(12),
          Container(
            child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
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
                          child: Text('Report', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('User', textAlign: TextAlign.center,),
                        )),
                        TableCell(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Datetime', textAlign: TextAlign.center,),
                        )),
                      ]
                  ),

                  for (int i = 0; i < (_post.length); i++)
                    TableHeaderAdmin().gett(i+1, _post[i]['content'], _post[i]['id_user'].toString() ,_post[i]['datetime'])
                ]

            ),
          )
        ],
      ),
    );
  }
}
