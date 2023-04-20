import 'package:flutter/material.dart';
import 'package:post_api_call/screens/home/model/homeModel.dart';
import 'package:post_api_call/utils/homeHelper.dart';

class homeProvider extends ChangeNotifier
{

  List<dynamic> getList = [];

  Future<List<dynamic>> getApiCall()
  async {

    homeHelper h1 = homeHelper();
    getList = await h1.GetApi();
    return getList;
  }

  Future<String> createData(pname,prate,pprice,poffer,pdesc,pcate)
  async {
    homeHelper h1 = homeHelper();

    String data = await h1.PostApiCall(pname, prate, pprice, poffer, pdesc, pcate);

    return data;
  }
}