import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/button.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/text_input.dart';
import '../../models/result_operation.dart';
import '../../services/account.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import 'check_verification.dart';

class Register extends StatefulWidget {
  final String mobilePhone;

  const Register(this.mobilePhone, {Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController representativeMobileController = TextEditingController();
  TextEditingController titleOfOrganizationController = TextEditingController();
  bool isLoading = false;
   String mobilePhone="";

  @override
  void initState() {
    mobilePhone = widget.mobilePhone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        backgroundColor: backgroundColor,
        body: Stack(children: [
          Image.asset('assets/images/login.jpg',
              width: MediaQuery.of(context).size.width),
          Column(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset('assets/images/logo.png', width: 180))),
            Container(
              padding: const EdgeInsets.only(left: 15,right: 15),
                width: MediaQuery.of(context).size.width,
                height: 470,
                child: Column(children: [

                  textInput('نام', firstNameController, AntIcons.userOutlined),
                  textInput('نام خانوادگی', lastNameController, AntIcons.userOutlined),
                 phoneNumber(),
                  textInput('عنوان سازمانی(اختیاری)', titleOfOrganizationController, Icons.home_work_outlined),
                  isLoading
                      ? Container(
                          margin: const EdgeInsets.only(top: 18),
                          height: 55,
                          width: 320,
                          child: Loading.circular())
                      : button('ورود به سامانه', mainColor, action)
                ]))
          ])
        ]));
  }
  void action() async {
    setState(() {
      isLoading = true;
    });
    ResultOperation result = await AccountService()
        .register(firstNameController.text, lastNameController.text, mobilePhone,titleOfOrganizationController.text);
    if (!mounted) return;
    if (result.isSuccess == true) {
      toastSuccess('گل پونه', 'کد فعالسازی برای شما ارسال شد', context);

      AccountService().login(mobilePhone);
      actionForRepresentative();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CheckVerification(mobilePhone)));
    } else {
      toastFail('خطا', result.message ?? '', context);
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget phoneNumber() {
    return textInputAction('شماره همراه معرف (اختیاری)', representativeMobileController, AntIcons.mobileOutlined,
            (String str) {
        }, TextInputType.phone);
  }

  void actionForRepresentative() async {
    if (representativeMobileController.text.length == 11) {
      setState(() {
        isLoading = true;
      });
      var points = await AccountService().setPointForRepresentativeUser(representativeMobileController.text,mobilePhone);
      if (!mounted) return;
      if (points.result?.points == true) {
        toastSuccess('گل پونه', "تخصیص امتیاز با موفقیت انجام شد", context);
        var points = await AccountService().setPointForSetupApplication(mobilePhone);
        if (!mounted) return;
        if (points.result?.points == true) {
        //  toastSuccess('گل پونه', "تخصیص امتیاز با موفقیت انجام شد", context);
        } else {
         // toastSuccess('گل پونه', "تخصیص امتیاز اپلبکیشن قبلا به شما تعلق گرفته است ", context);

        }
      } else {
        toastSuccess('گل پونه', "تخصیص امتیاز قبلا بع شمل تعلق گرفته است ", context);
      }
  }

}
}
