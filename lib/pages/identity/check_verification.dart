import 'dart:async';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/common/splash.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../models/result_operation.dart';
import '../../services/account.dart';
import '../../shared/button.dart';
import '../../shared/converter.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';

class CheckVerification extends StatefulWidget {
  final String mobilePhone;

  const CheckVerification(this.mobilePhone, {Key? key}) : super(key: key);

  @override
  State<CheckVerification> createState() => _CheckVerificationState();
}

class _CheckVerificationState extends State<CheckVerification> {
  TextEditingController smsController = TextEditingController();
  bool isLoading = false;
  late String mobilePhone;
  String code = "";
  late Timer timer;
  int start = 120;
  String signature = "http://golpouneh.com";
  bool isFourDigits = false;

  @override
  void initState() {
    mobilePhone = widget.mobilePhone;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        backgroundColor: backgroundColor,
        body: Stack(children: [
          SingleChildScrollView(
            child: Image.asset('assets/images/login.jpg',
                width: MediaQuery.of(context).size.width),
          ),
          Column(children: [
            Expanded(child: Container()),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 2.0, blurRadius: 2.0, offset: Offset(2.0, 2.0))
                      ],
                      color: Colors.white,
                    ),
                      child: Text('کد ارسالی برای شماره $mobilePhone را وارد نمایید.'),
                  ),
                  verificationCode(),
                  isLoading
                      ? Container(
                          margin: const EdgeInsets.only(top: 18),
                          height: 55,
                          width: 320,
                          child: Loading.circular())
                      : button(
                          code.isEmpty
                              ? start == 0
                                  ? 'ارسال مجدد'
                                  : 'ارسال مجدد پس از $start ثانیه'
                              : 'تایید کد فعالسازی',
                          mainColor2,
                          action)
                ]))
          ])
        ]));
  }

  Widget verificationCode() {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        height: 55,
        width: 320,
        child: TextField(
            controller: smsController,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.go,
            onSubmitted: (String str) {
              action();
            },
            onChanged: (text) {
              smsController.text = convertNumberToEnglish(smsController.text);
              smsController.selection = TextSelection.fromPosition(
                  TextPosition(offset: smsController.text.length));
              if (smsController.text.length == 4) {
                setState(() {
                  code = smsController.text;
                });
              } else {
                setState(() {
                  code = '';
                });
              }
            },
            decoration: InputDecoration(
                labelText: 'کد ورود',
                labelStyle: const TextStyle(color: textColor),
                fillColor: mainColor,
                prefixIcon: const Icon(AntIcons.unlockOutlined),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor2, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor2, width: 2),
                    borderRadius: BorderRadius.circular(15)))));
  }

  void action() async {
    if (smsController.text.length == 4) {
      setState(() {
        isLoading = true;
      });
      ResultOperation result =
          await AccountService().checkSms(mobilePhone, smsController.text);
      if (!mounted) return;
      if (result.isSuccess == true) {
        var points = await AccountService().setPointForSetupApplication(mobilePhone);
        if (!mounted) return;
        if (points.result?.points == true) {
          toastSuccess('گل پونه', "تخصیص امتیازاپلبکیشن با موفقیت انجام شد", context);
        } else {
          toastSuccess('گل پونه', "تخصیص امتیاز اپلبکیشن قبلا به شما تعلق گرفته است  ", context);

        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Splash()));
      } else {
        toastFail('گل پونه', result.message ?? '', context);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      if (start == 0) {
        setState(() {
          isLoading = true;
        });
        ResultOperation result = await AccountService().login(mobilePhone);
        if (!mounted) return;
        if (result.isSuccess == true) {
          toastSuccess(result.message ?? "", 'کد فعالسازی برای شما ارسال شد', context);
          setState(() {
            start = 120;
          });
          startTimer();
        } else {
          toastFail('خطا در ارسال کد', 'لطفا بعدا تلاش فرمایید', context);
          setState(() {
            start = 120;
          });
          startTimer();
        }
        setState(() {
          isLoading = false;
        });
      } else {
        toastFail('گل پونه', 'کد فعالسازی باید ۴ رقم باشد', context);
      }
    }
  }
}
