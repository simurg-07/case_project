import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';
import '../services/service.dart';
import 'detailpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Model>? data;

  late List<Model>? display_list = data;


  getData() async {
    data = await ModelServices().getPosts();
    if (data != null) {
      return data;
    }
  }




  void updateList(String value) {
    setState(() {
      display_list = data!.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(45), bottomLeft: Radius.circular(45)), color: Color(0xff7b3fd3)),
                ),
                Positioned(
                    child: Text(
                  "Users",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                )),
                Positioned(
                  bottom: 30,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 50,
                    child: TextFormField(
                      onChanged: (value) => updateList(value),
                      //controller: UserName,
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(8, 12, 0, 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data == null || snapshot.data == false) {
                    return Center(
                      child: Text("Bir hata meydana geldi"),
                    );
                  }
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: display_list!.length,
                    itemBuilder: (context, index) {
                      Model info = data![index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          info: info,
                                        ))),
                            child: Container(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/foto.jpeg",
                                  ),
                                ),
                                title: Text(info.name),
                                subtitle: Text(info.username),
                                trailing: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(color: Color(0xff7b3fd3), borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      info.id.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Divider(color: Color(0xff7b3fd3)),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
