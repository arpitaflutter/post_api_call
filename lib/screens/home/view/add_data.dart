import 'package:flutter/material.dart';
import 'package:post_api_call/screens/home/model/homeModel.dart';
import 'package:post_api_call/screens/home/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtcategory = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   Provider.of<homeProvider>(context, listen: false).getApiCall();
  // }

  homeProvider? ht, hf;
  List<UserModel> l2 = [];

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<homeProvider>(context, listen: true);
    hf = Provider.of<homeProvider>(context, listen: false);

    List<dynamic> l1 = [];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Insert the data"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name:- ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtrate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Rate:- ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Price:- ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtoffer,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Offer:- ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtcategory,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Category:- ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtdesc,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description:- ",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async{
                    String name = txtname.text;
                    String rate = txtrate.text;
                    String offer = txtoffer.text;
                    String price = txtprice.text;
                    String desc = txtdesc.text;
                    String cate = txtcategory.text;

                    // UserModel u1 = UserModel(
                    //   productImage: "google.com",
                    //   productName: name,
                    //   productRate: rate,
                    //   productOffer: offer,
                    //   productPrice: price,
                    //   productDesc: desc,
                    //   productCategory: cate,
                    //   id: "Id"
                    // );

                    String msg = await hf!.createData(name, rate, price, offer, desc, cate);
                    hf!.getApiCall();
                    print(msg);
                    Navigator.pushNamed(context, 'data');
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text("Add Data",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
