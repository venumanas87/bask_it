import 'package:flutter/material.dart';

import '../models/shop_model.dart';
import '../services/api.dart';

class ShopProvider with  ChangeNotifier{
  Shop shop = Shop(name: "",code: "");
  bool loading = false;
  bool complete = false;
  bool error = false;


  getShopFromFirebase(context,String code) async{
    loading = true;
    try{
      shop = await Api().getDataCollection(code);
      complete = true;
      loading = false;
    }catch(e){
      shop = Shop(name: "Not a valid shop code",code: "");
      error = true;
      loading = false;
    }
    notifyListeners();
  }


  checkCode(String code) async{
    if(code.length==5){
      loading = true;
      try{
        shop = await Api().getDataCollection(code);
        shop.name = "Code already used";
        error = true;
        loading = false;
      }catch(e){
        shop = Shop(name: "Available",code: "");
        complete = true;
        loading = false;
      }
      notifyListeners();
    }
  }

  reset(){
    loading = false;
    complete = false;
    error = false;
    shop = Shop(name: "",code: "");
    notifyListeners();
  }

}