import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gol_pouneh/controller/delivery_price_controller/delivery_price_controller.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/toast.dart';

import '../../shared/color.dart';

class ChooseHowToSend extends StatefulWidget {
  const ChooseHowToSend({Key? key}) : super(key: key);

  @override
  State<ChooseHowToSend> createState() => _ChooseHowToSendState();
}

class _ChooseHowToSendState extends State<ChooseHowToSend> {
  final DeliveryPriceController deliveryPriceController =
      Get.put(DeliveryPriceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          title: const Text("انتخاب نحوه ارسال")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7.0,
                          offset: Offset(3, 2)),
                    ],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.lightGreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/bag.png',
                      height: 80,
                      width: 90,
                      fit: BoxFit.fitWidth,
                    ),
                    const Text("با خودم میبرم")
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  DataMemory.getWithUrSelf = true;
                  DataMemory.activePayBtn = true;
                  Navigator.pop(context);
                });
                toastSuccess("این گزینه برای شما فعال شد", "", context);
              },
            ),
            InkWell(
              child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7.0,
                          offset: Offset(3, 2)),
                    ],
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.lightGreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/scooter.png',
                      height: 80,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text("برام بفرستید")
                  ],
                ),
              ),
              onTap: () {
                if (deliveryPriceController.totalPrice.value < 50000) {
                  toastFail(
                      "برای خرید های کمتر از 50 هزار تومان قابلیت ارسال پیک وجود ندارد",
                      "",
                      context);
                } else {
                  toastSuccess("این گزینه برای شما فعال شد", "", context);
                  Navigator.of(context).pop();
                  setState(() {
                    DataMemory.sendToMe = true;
                    DataMemory.activePayBtn = true;
                    Navigator.of(context).pop();
                  });
                  toastSuccess("این گزینه برای شما فعال شد", "", context);
                }

                // Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
