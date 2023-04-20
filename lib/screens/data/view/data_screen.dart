import 'package:flutter/material.dart';
import 'package:post_api_call/screens/home/model/homeModel.dart';
import 'package:provider/provider.dart';

import '../../home/provider/homeProvider.dart';

class data_screen extends StatefulWidget {
  const data_screen({Key? key}) : super(key: key);

  @override
  State<data_screen> createState() => _data_screenState();
}

class _data_screenState extends State<data_screen> {
  homeProvider? ht, hf;

  @override
  void initState() {
    super.initState();

    Provider.of<homeProvider>(context, listen: false).getApiCall();
  }

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<homeProvider>(context, listen: true);
    hf = Provider.of<homeProvider>(context, listen: false);

    // List<UserModel> l1 = ModalRoute.of(context)!.settings.arguments as List<UserModel>;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Products Details"),
            backgroundColor: Colors.black,
          ),
          body: FutureBuilder(
            future: ht!.getApiCall(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List<dynamic>? getList = snapshot.data;
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          border:
                                              Border.all(color: Colors.black),
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Text(
                                              "${ht!.getList[index].productImage}",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ),
                                    SizedBox(
                                      height: 23,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${ht!.getList[index].id}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${ht!.getList[index].productName}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Rs. ${ht!.getList[index].productPrice}",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    // SizedBox(height: 25,),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.end,
                                    //   children: [
                                    //     Text("${hf!.getList[index].productDesc}")
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rate: ${ht!.getList[index].productRate}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      "Offer: ${ht!.getList[index].productOffer}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${ht!.getList[index].productDesc}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      "${ht!.getList[index].productCategory}",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: getList!.length);
              }
              return CircularProgressIndicator();
            },
          )
      ),
    );
  }
}
