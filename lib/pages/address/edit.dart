import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/address/pick_location.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:gol_pouneh/shared/text_input.dart';

import '../../models/address.dart';
import '../../models/result_operation.dart';
import '../../services/address.dart';
import '../../shared/appbar.dart';
import '../../shared/color.dart';
import '../../shared/data_memory.dart';
import '../../shared/toast.dart';

class EditAddressState extends State<EditAddress> {
  late AddressModel model;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController mobilePhoneController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  bool isLoading = false;
  bool deleteLoading = true;

  @override
  void initState() {
    model = widget.model;
    super.initState();
    setState(() {
      nameController.text = model.buyerName ?? '';
      addressController.text = model.buyerAddress ?? '';
      postalCodeController.text = model.postalCode ?? '';
      mobilePhoneController.text = model.mobile ?? '';
      latController.text = model.latitude ?? '';
      longController.text = model.longitude ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithAction('مدیریت آدرس', Icons.delete_forever, () async {
          setState(() {
            isLoading = true;
          });
          ResultOperation result = await AddressService().delete(model.id!);
          if (!mounted) return;
          if (result.isSuccess == true) {
            setState(() {
              deleteLoading = false;
            });
            toastSuccess(
                'عملیات با موفقیت انجام شد', result.message ?? '', context);
            DataMemory.addresses.clear();
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          } else {
            toastFail('خطایی رخ داد', result.message ?? '', context);
            setState(() {
              isLoading = false;
            });
          }
        }),
        body: deleteLoading
            ? Container(
                padding: const EdgeInsets.only(top: 20),
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner.jpg"),
                      fit: BoxFit.cover),
                ),
                child: isLoading
                    ? Loading.circular()
                    : SingleChildScrollView(
                        primary: true,
                        child: Column(children: <Widget>[
                          const SizedBox(width: double.infinity),
                          textInput('نام دریافت کننده', nameController,
                              AntIcons.userOutlined),
                          textInput('شماره تماس', mobilePhoneController,
                              AntIcons.mobileOutlined, TextInputType.number),
                          textInputMultiline('نشانی', addressController,
                              Icons.pin_drop_outlined),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const PickLocation()))
                                    .then((value) {
                                  if (value != null) {
                                    latController.text = value[0].toString();
                                    longController.text = value[1].toString();
                                  }
                                });
                              },
                              child: const Text("انتخاب از روی نقشه")),
                          textInput('کدپستی', postalCodeController,
                              AntIcons.homeOutlined, TextInputType.number),
                          submit()
                        ])),
              )
            : Container(
                alignment: Alignment.topRight,
                child: const Text("ایتم مورد نظر حذف شد"),
              ));
  }

  Widget submit() {
    return GestureDetector(
        child: Container(
            width: 320,
            height: 55,
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.circular(12)),
            child: const Text('ذخیره آدرس',
                style: TextStyle(color: titleColor, fontSize: 15))),
        onTap: () async {
          if (nameController.text.length > 5) {
            if (mobilePhoneController.text.length == 11) {
              if (addressController.text.length > 5) {
                if (postalCodeController.text.length == 10) {
                  if (latController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    ResultOperation result = await AddressService().edit(
                      model.id!,
                      nameController.text,
                      addressController.text,
                      postalCodeController.text,
                      mobilePhoneController.text,
                      longController.text,
                      latController.text,
                      // DataMemory.longitude.toString(),
                      // DataMemory.latitude.toString()
                    );
                    if (!mounted) return;
                    if (result.isSuccess == true) {
                      DataMemory.addresses.clear();
                      Navigator.pop(context, true);
                    } else {
                      toastFail('خطایی رخ داد', result.message ?? '', context);
                      setState(() {
                        isLoading = false;
                      });
                    }
                  } else {
                    toastFail('خطا در اطلاعات', 'موقعیت مکانی خود را ثبت کنید',
                        context);
                  }
                } else {
                  toastFail(
                      'خطا در اطلاعات', 'کد پستی باید ۱۰ رقم باشد', context);
                }
              } else {
                toastFail('خطا در اطلاعات', 'نشانی کوتاه است', context);
              }
            } else {
              toastFail('خطا در اطلاعات', 'شماره تماس اشتباه است', context);
            }
          } else {
            toastFail('خطا در اطلاعات', 'نام دریافت کننده کوتاه است', context);
          }
        });
  }
}

class EditAddress extends StatefulWidget {
  final AddressModel model;

  const EditAddress(this.model, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditAddressState();
}
