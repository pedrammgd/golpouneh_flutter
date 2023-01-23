import 'package:flutter/material.dart';
import 'package:gol_pouneh/models/discount.dart';
import 'package:gol_pouneh/services/discount.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  bool isLoading = true;
  bool receiveError = false;
  List<DiscountModel> discounts = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    discounts = await DiscountService().discountList();
    print('discounts$discounts');
    if (discounts.isEmpty) {
      receiveError = true;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("تخفیف ها"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : discounts.isEmpty
                      ? const Center(child: Text("شما هیچ تخفیفی ندارید"))
                      : Column(
                          children: [
                            for (int i = 0; i < discounts.length; i++)
                              item(discounts[i])
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(DiscountModel discount) {
    Jalali start = Jalali.fromDateTime(DateTime.tryParse(discount.startDate)!);
    Jalali end = Jalali.fromDateTime(DateTime.tryParse(discount.endDate)!);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              discount.isEnable
                  ? const Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 20,
                    )
                  : const Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 20,
                    ),
              discount.isEnable ? const Text("فعال") : const Text("غیر فعال"),
            ],
          ),
          Text(
            discount.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("تاریخ آغاز تخفیف"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${start.hour}:${start.minute}"),
                  Text("${start.year}/${start.month}/${start.day}"),
                ],
              ),
            ],
          ),
          const Divider(
            height: 20.0,
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("تاریخ پایان تخفیف"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${end.hour}:${end.minute}"),
                  Text("${end.year}/${end.month}/${end.day}"),
                ],
              ),
            ],
          ),
          const Divider(
            height: 20.0,
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("کد تخفیف"),
              Text(discount.offCode),
            ],
          ),
          const Divider(
            height: 20.0,
            thickness: 1.0,
          ),
          discount.amount != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("میزان تخفیف"),
                    Text(discount.amount!.toInt().toString()),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("درصد تخفیف"),
                    Text(discount.percent!.toInt().toString()),
                  ],
                ),
          const Divider(
            height: 20.0,
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("تعداد:"),
                  Text(discount.count.toInt().toString()),
                ],
              ),
              Row(
                children: [
                  const Text("استفاده شده:"),
                  Text(discount.count.toInt().toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
