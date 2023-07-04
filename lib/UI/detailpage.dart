import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contants/halfcircle.dart';
import '../model/model.dart';

class DetailPage extends StatefulWidget {
  final Model info;

  const DetailPage({Key? key, required this.info}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),

                  ),
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(height: 300),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 225),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffbd9fe9),
                            radius: 70.0,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/foto.jpeg'),
                              radius: 68.0,
                            ),
                          ),
                          Positioned(
                              right: 15,
                              bottom: 3,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                color: Color(0xff7b3fd3),
                                  borderRadius: BorderRadius.circular(35)
                                ),
                                child: Icon(Icons.add, color: Colors.white,),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 370),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Username: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                widget.info.username,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Full Name: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                widget.info.name,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Website: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text(
                                widget.info.website,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 470),
                    child: Center(
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 60,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(widget.info.company.name),
                              SizedBox(height: 3,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Catch Phrase: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.info.company.catchPhrase,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Contract",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Text(
                                    widget.info.phone,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text(
                                    "Email: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Text(
                                    widget.info.email,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Adress: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${widget.info.address.street}, ${widget.info.address.suite}, ${widget.info.address.city}, ${widget.info.address.zipcode}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
