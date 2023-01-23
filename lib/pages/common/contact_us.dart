import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late final TextEditingController subjectController;
  late final TextEditingController contentController;
  late bool isLoading;

  @override
  void initState() {
    subjectController = TextEditingController();
    contentController = TextEditingController();
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    subjectController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("ارتباط با ما"),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/banner.jpg"),
          fit: BoxFit.cover,
        )),
        child: isLoading == false
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text("ارتباط با ما",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(" از طریق راه های زیر می توانید با ما در ارتباط باشید . ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                   const SizedBox(height: 15,),
                  Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                        Icon(Icons.location_on,color: Colors.red,size: 45,),
                       Expanded(child:  Text(" شیراز، شهرک صنعتی، میدان ششم، بلوار الکترونیک،"
                          " خیابان علوم، کوچه 422، شرکت گل پونه ",softWrap: true,
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                      )  ],
                   ),
                   const SizedBox(height: 20,),
                   Container(
                     alignment: Alignment.center,
                     width: 250,
                     height: 70,
                     padding: const EdgeInsets.all(10),
                     margin: const EdgeInsets.only(top: 20),
                     decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.withOpacity(0.3),
                               spreadRadius: 2,
                               blurRadius: 4,
                               offset: const Offset(0, 3))
                         ],
                       color: Colors.white,
                       borderRadius: const BorderRadius.all(Radius.circular(15))
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Icon(Icons.phone,color: Colors.green,size: 30,),
                         Column(
                           children: [
                             InkWell(
                               onTap: (){
                                 dialNumber(phoneNumber: "071-3773-0255", context: context);
                               },
                               child: const Text("071-3773-0255",
                                 style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),

                             ), const SizedBox(height: 7,),
                             InkWell(
                               onTap: (){
                                 dialNumber(phoneNumber: "071-3773-0229", context: context);
                               },
                               child:  const Text("071-3773-0229",
                                 style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),

                             ),

                           ],
                         )
                       ],
                     ),
                   ),

                    row("0917-500-2019", Icons.fax_outlined,Colors.blue,0),
                    row("0917-500-2019", Icons.phone_android,Colors.red,1),
                    row("info@golpouneh.com", Icons.email,Colors.orange,0),


                   /* textInput("موضوع", subjectController, Icons.subject),
                    textInputMultiline("پیام", contentController, Icons.message),
                    button(
                      "ثبت پیام",
                      Colors.blueAccent,
                      () async {
                        setState(() {
                          isLoading = true;
                        });
                        String subject = subjectController.text.trim();
                        String content = contentController.text.trim();
                        if (subject.length > 1 && content.length > 5) {
                          if (await ContactUsService().submitMessage(subject, content)) {
                            subjectController.text = "";
                            contentController.text = "";
                            toastMessage(true);
                          } else {
                            toastMessage(false);
                          }
                        } else {
                          toastFail("خطا", 'لطفا اطلاعات مورد نیاز را پر کنید', context);
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),*/
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
  Future<void> dialNumber(
      {required String phoneNumber, required BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      //
    }

    return;
  }
Widget row(String title,IconData iconData, MaterialColor color,int id){
    return
      InkWell(
        onTap: (){
          if(id==1){
            dialNumber(phoneNumber: title, context: context);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 70,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3))
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(iconData,color:color,size: 30,),
              Text(title,
                style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),

            ],
          ),
        ),
      );

}
  void toastMessage(
    bool success,
  ) {
    if (success) {
      toastSuccess("موفقیت", "ارسال پیام شما با موفقیت انجام شد", context);
    } else {
      toastFail(
          "خطا", "ارسال پیام شما با خطا مواجه شدِ لطفا بعدا دوباره امتحان کنید", context);
    }
  }
}
