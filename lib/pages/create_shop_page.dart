import 'package:bask_it/provider/shop_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop_model.dart';
import '../widgets/progress_icon.dart';

class CreateShopPage extends StatefulWidget {
  const CreateShopPage({Key? key}) : super(key: key);

  @override
  State<CreateShopPage> createState() => _CreateShopPageState();
}

class _CreateShopPageState extends State<CreateShopPage> {

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  ShopProvider? shopP;

  @override
  void initState() {
    shopP?.checkCode("vwxyz");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    codeController.addListener(() {
      if(codeController.text.length==5){
        shopP?.checkCode(codeController.text);
      }else{
        shopP?.reset();
      }
    });
    shopP = Provider.of<ShopProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: Material(
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        onTap: (){
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Create New Shop",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            editText(context,"Enter shop name","My Shop",shopNameController),
            SizedBox(height: 30,),
            editText(context, "Enter password", "",passwordController),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "This will be your password to manage the shop",
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14
                    )
                ),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(height: 10,),
            shopCode(shopP!.shop),
            Expanded(child: Container()),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.black87),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )),
                  minimumSize: MaterialStateProperty.resolveWith((states) => Size(MediaQuery.of(context).size.width-40, 60)),
                ),
                onPressed: (){shopP?.checkCode(codeController.text.toString());},
                child: Text(
                  "Complete Setup",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ),
                )),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Widget editText(BuildContext context,String titleText,String hintText,TextEditingController controller) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16
              )
          ),
        ),
        SizedBox(height: 10,),
        TextField(
          cursorColor: Colors.black,
          controller: controller,
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),
          ),
          //controller: textController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 3
                )
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
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
        SizedBox(height: 10,)
      ],
    );
  }



  Widget shopCode(Shop shop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter shop code of your choice",
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
              controller: codeController,
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

