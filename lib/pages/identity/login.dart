import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/terms/terms.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:gol_pouneh/shared/text_input.dart';
import '../../models/result_operation.dart';
import '../../services/account.dart';
import '../../shared/toast.dart';
import 'check_verification.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobileController = TextEditingController();
  bool isLoading = false;
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/login.jpg',
              ),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Column(
                children: [
                  phoneNumber(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Terms(),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Text("متن "),
                            Text(
                              "سیاست حفظ حریم خصوصی ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                            Text("را خوانده ام"),
                          ],
                        ),
                      ),
                      Checkbox(
                          value: checkBox,
                          onChanged: (bool? change) {
                            setState(() {
                              checkBox = change!;
                            });
                          }),
                    ],
                  ),
                  isLoading
                      ? Container(
                          margin: const EdgeInsets.only(top: 18),
                          height: 55,
                          width: 320,
                          child: Loading.circular())
                      : GestureDetector(
                          onTap: () {
                            checkBox ? action() : () => null;
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.80,
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: checkBox ? mainColor2 : mainColor2.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "ورود به سامانه",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget phoneNumber() {
    return textInputAction('شماره همراه', mobileController, AntIcons.mobileOutlined,
        (String str) {
      //  action();
    }, TextInputType.phone);
  }

  void action() async {
    if (mobileController.text.length == 11) {
      setState(() {
        isLoading = true;
      });
      ResultOperation result = await AccountService().login(mobileController.text);
      if (!mounted) return;
      if (result.isSuccess == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CheckVerification(mobileController.text)));
      } else if (result.isSuccess == false) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Register(mobileController.text)));
      } else {
        toastFail('گل پونه', result.message ?? '', context);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      toastFail('گل پونه', 'تعداد ارقام شماره موبایل باید 11 باشد', context);
    }
  }

  /// OLD

// Widget textInput() {
//   return TextFormField(
//       controller: mobileController,
//       decoration: const InputDecoration(
//           hintText: 'شماره همراه',
//           hintStyle: TextStyle(fontSize: 17, color: Colors.grey)));
// }

// Widget submit() {
//   return Container(
//       margin: const EdgeInsets.only(bottom: 70),
//       alignment: Alignment.bottomLeft,
//       width: MediaQuery.of(context).size.width,
//       padding: const EdgeInsets.all(20),
//       child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               fixedSize: const Size(50, 50),
//               primary: mainColor,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//           onPressed: () async {
//             if (mobileController.text.length == 11) {
//               setState(() {
//                 isLoading = true;
//               });
//               ResultOperation result =
//                   await AccountService().login(mobileController.text);
//               if (!mounted) return;
//               if (result.isSuccess == true) {
//                 toastSuccess('گل پونه', 'کد فعالسازی برای شما ارسال شد', context);
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             CheckVerification(mobileController.text)));
//               } else if (result.isSuccess == false) {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Register(mobileController.text)));
//               } else {
//                 toastFail('گل پونه', result.message ?? '', context);
//                 setState(() {
//                   isLoading = false;
//                 });
//               }
//             } else {
//               toastFail('گل پونه', 'تعداد ارقام شماره موبایل باید 11 باشد', context);
//             }
//           },
//           child: isLoading
//               ? Loading.circular(Colors.white)
//               : const Icon(Icons.arrow_forward, color: Colors.white)));
// }
}
