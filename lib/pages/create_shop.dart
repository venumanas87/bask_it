import 'package:bask_it/provider/shop_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/api.dart';
import 'create_shop_page.dart';

class CreateShop extends StatelessWidget {
  const CreateShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateShopPage();
  }
}

