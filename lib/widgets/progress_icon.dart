import 'package:bask_it/provider/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressIcon extends StatefulWidget {
  const ProgressIcon({Key? key}) : super(key: key);

  @override
  State<ProgressIcon> createState() => _ProgressIconState();
}

class _ProgressIconState extends State<ProgressIcon> {

  @override
  Widget build(BuildContext context) {
    ShopProvider shopP = Provider.of<ShopProvider>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Visibility(
            visible: shopP.loading,
            child: const CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 3,
            ),
          ),
        ),
        Visibility(
          visible: shopP.complete,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        Visibility(
          visible: shopP.error,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
