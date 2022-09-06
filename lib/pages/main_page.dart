
import 'package:bask_it/provider/shop_provider.dart';
import 'package:bask_it/widgets/progress_icon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop_model.dart';
import 'create_shop.dart';
class MainPage  extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController textController = TextEditingController();
  ShopProvider? shopP;


  @override
  void initState() {
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    shopP = Provider.of<ShopProvider>(context);
    textController.addListener(checkCode);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 70),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Baskit",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 90),
                shopCode(shopP!.shop),
                Visibility(
                  visible: shopP!.complete,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black87),
                          borderRadius: const BorderRadius.all(Radius.circular(15))
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width-40, 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          ),
                          //Size(MediaQuery.of(context).size.width-40, 0)
                        ),
                        onPressed: null ,
                        child: Text(
                          "Visit Shop",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),

          bottomBlackNewShop()

        ],
      ),
    );
  }

  void checkCode(){
    if(textController.text.length==5){
      shopP?.getShopFromFirebase(context, textController.text);
    }else{
      shopP?.reset();
    }

  }

  Widget bottomBlackNewShop(){
    return Align(
      heightFactor: 1,
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        color: Colors.black87,
        child: Center(
          child: InkWell(
            onTap:(){Get.to(() => const CreateShop(),transition: Transition.rightToLeft);},
            focusColor: Colors.white,
            splashColor: Colors.white,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width-40, 0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                  //Size(MediaQuery.of(context).size.width-40, 0)
                ),
                onPressed:null,
                child: Text(
                  "Create your own shop",
                  style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      )
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget shopCode(Shop shop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter shop code",
          style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16
              )
          ),
        ),
        const SizedBox(height: 10),
        Stack(
            alignment: Alignment.centerRight,
            children: [TextField(
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
              ],
              cursorColor: Colors.black,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    letterSpacing: 10.0
                ),
              ),
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 3
                    )
                ),
                hintText: "XXXXX",
                hintStyle: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        letterSpacing: 10.0
                    )
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 3
                    )
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              ),
            ),
              const Positioned(
                right: 20,
                child: ProgressIcon(),
              )
            ]
        ),
        const SizedBox(height: 5,),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
                shop.name
            )
        ),
        const SizedBox(height: 90,),

      ],
    );
  }
}
