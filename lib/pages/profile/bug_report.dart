import 'package:flutter/material.dart';
import 'package:gol_pouneh/services/contact_us.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/toast.dart';
import '../../shared/appbar.dart';

class BugReportState extends State<BugReport> {
  TextEditingController contentEditingController = TextEditingController();
  bool showDetails=false;
  String subject="";

  @override
  void dispose() {
    contentEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar("گزارش خطا"),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
            ),
            child:
          ListView(
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text("پشتیبانی",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),),
              showDetails?showDetailsWidget():Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5))
                ),
                child: Column(
                  children: [
                    row("مشکل در سفارش", "مغایرت ، لغو، تغییر ادرس و ..."),
                    bottomCardDivider(),
                    row("مشکل در پرداخت و کیف پول", " پرداخت ناموفق، عدم بازگشت وجه و ..."),
                    bottomCardDivider(),
                    row("سایر مشکلات ", "کد تخفیف، خطای نرم افزار و ... "),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.only(bottom: 10,top: 15),
                child: const Text("مشکلتان در لیست بالا نیست؟",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),),
              description(),
              submit()
            ],
          )
          /*ListView(children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 30, right: 25, left: 25, bottom: 10),
                  child: const Text(
                      'لطفا در صورتی که مشکلی در عملکرد نرم افزار مشاهده کردید، با ما در میان بگذارید.',
                      style: TextStyle(fontSize: 14))),
              description(),
              submit(),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text('طراحی و توسعه توسط ABLY.ir',
                      style: TextStyle(fontSize: 12, color: Colors.black)))
            ])*/
        ));
  }
  Widget showDetailsWidget(){
    return InkWell(
      child:Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3))
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5))
        ),
        child: Column(
          children: [
            rowDetails("برخی از اقلام سفارشم ارسال نشده است"),
            bottomCardDivider(),
            rowDetails("از کیفیت سفارش ناراضی هستم"),
            bottomCardDivider(),
            rowDetails("میخواهم ادرس تحویل سفارش را تغییر دهم "),
          ],
        ),
      ) ,
      onTap: (){
        // setState(() {
        //   showDetails=false;
        // });
      },
    );
  }
  Widget rowDetails(String subject1){
    return InkWell(
      child:  Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(subject1,style: const TextStyle(fontSize: 15),),

            // const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)

          ],
        ),
      ),
        onTap: () async {
        subject=subject1;
        if (subject1.trim().length > 2) {
           if(contentEditingController.text.isNotEmpty)
            {
              if (await ContactUsService().submitMessage(subject1, contentEditingController.text.toString())) {
                doThing(() {
                  toastSuccess('ثبت شد', 'با تشکر از بازخورد شما گزارش شما به زودی پیگیری میشود', context);
                });
              } else {
                doThing(() {
                  toastSuccess('ثبت نشد', 'ایراد در ثبت گزارش', context);
                });
              }
            }
           else{
             if (await ContactUsService().submitMessage(subject1, "بدون ذکر توضیحات")) {
               doThing(() {
                 toastSuccess('ثبت شد', 'با تشکر از بازخورد شما گزارش شما به زودی پیگیری میشود', context);
               });
             } else {
               doThing(() {
                 toastSuccess('ثبت نشد', 'ایراد در ثبت گزارش', context);
               });
             }
           }
          } else {
            doThing((){
              toastDanger("خطا", "لطفا اطلاعات را کامل ارسال کنید", context);
            });
          }
          setState(() {
            showDetails=false;
          });
        }
    );

  }
  Widget row(String subject,String text){
    return InkWell(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)

            ],
          ),
          const SizedBox(height: 5,),
          Text(text,style: const TextStyle(fontSize: 13,color: Colors.black38),),
          const SizedBox(height: 15,),

        ],
      ),
      onTap: (){
        setState(() {
          showDetails=true;
        });
      },
    );

  }

  Widget bottomCardDivider() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only( bottom: 10),
        height: 1,
        color: const Color(0xffe3e3e3));
  }
  Widget description() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextFormField(
            controller: contentEditingController,
            maxLines: 5,
            decoration: InputDecoration(
                labelText: 'توضیحات خود را بنویسید...',
                labelStyle: const TextStyle(color: Colors.black87),
                fillColor: backgroundColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(15)))));
  }

  Widget submit() {
    return
     Center(child:  GestureDetector(
         behavior: HitTestBehavior.translucent,
         child: Container(
             height: 50,
             width: 150,
             margin: const EdgeInsets.only(top: 15),
             decoration: const BoxDecoration(
                 color: mainColor, borderRadius: BorderRadius.all(Radius.circular(6))),
             child: const Center(
                 child:
                 Text('ارسال', style: TextStyle(color: Colors.white, fontSize: 17)))),
         onTap: () async {



           String text = contentEditingController.text;
           if (text.trim().length > 2) {
             if(subject.isNotEmpty) {
               if (await ContactUsService().submitMessage(subject, text)) {
                 doThing(() {
                   toastSuccess('ثبت شد', ' با تشکر از بارخورد شما گزارش شما به زودی پیگیری میشود', context);
                   contentEditingController.text = "";
                 });
               } else {
                 doThing(() {
                   toastSuccess('ثبت نشد', 'ایراد در ثبت گزارش', context);
                 });
               }
            }else{
               if (await ContactUsService().submitMessage("گزارش خظا", text)) {
                 doThing(() {
                   toastSuccess('ثبت شد', ' با تشکر از بارخورد شما گزارش شما به زودی پیگیری میشود', context);
                   contentEditingController.text = "";
                 });
               } else {
                 doThing(() {
                   toastSuccess('ثبت نشد', 'ایراد در ثبت گزارش', context);
                 });
               }
             }
           } else {
             doThing((){
               toastDanger("خطا", "لطفا اطلاعات را کامل ارسال کنید", context);
             });
           }
         }),);
  }

  void doThing(Function doThing) {
    doThing();
  }
}

class BugReport extends StatefulWidget {
  const BugReport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BugReportState();
}
