import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:laporan_masyarakat/providers/auth_provider.dart';
import 'package:laporan_masyarakat/widgets/table_header.dart';
import 'package:provider/provider.dart';

import '../constants/contant.dart';

class ReportUser extends StatefulWidget {
  const ReportUser({Key? key}) : super(key: key);

  @override
  State<ReportUser> createState() => _ReportUserState();
}

class _ReportUserState extends State<ReportUser> {

  late String _report;
  final reportController = TextEditingController();


  Future fetchPost(userId) async {
    final response =
    await http.post(Uri.parse('${Constant.apiReport}?report=$_report&id_user=$userId'));

    if(jsonDecode(response.body)){
      // print(response.body);
      // final parsed = jsonDecode(response.body);
      // return {'ok' : 'oke', 'parsed' : parsed};
    }
    return 'nah';
  }

  @override
  Widget build(BuildContext context) {
    int userID = context.read<AuthProvider>().id_user;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Report', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20),),
          const Gap(25),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text('   Tuliskan pengaduan anda disini', textAlign: TextAlign.start,),
                const Gap(18),
                 TextField(
                  onChanged: (e)=>{
                    setState(()=>{
                      _report = e,
                    })
                  },
                   controller: reportController,
                  maxLines: null,
                  minLines: 3,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pesan',
                    hintText: 'Ketikkan semua yang ingin anda sampaikan..'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Gap(12),
                    Column(
                      children: [
                        const Gap(12),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
                          ),
                          icon: const Icon(Icons.send),
                          onPressed: ()=>{
                            fetchPost(userID)
                          },
                          label: const Text('Submit', style: TextStyle(fontSize: 16),),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ) ;
  }
}
