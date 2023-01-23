import 'package:flutter/material.dart';
import '../../services/cart.dart';
import '../../shared/appbar.dart';
import '../../shared/color.dart';
import '../../shared/text_input.dart';
import '../../shared/toast.dart';

class DiscountCode extends StatefulWidget {

 const  DiscountCode({Key? key}) : super(key: key);

  @override
  State<DiscountCode> createState() => _DiscountCodeState();
}

class _DiscountCodeState extends State<DiscountCode> {
  String? discountCodeResult;
  TextEditingController enterDiscountController = TextEditingController();


  setDiscountCode() async{
    var setDiscountCode= await CartService().setDiscountCode(enterDiscountController.text.toString());
    print(setDiscountCode.Type);
    if(setDiscountCode.Type ==0){
      Navigator.pop(context , Text(''));
      toastSuccess(setDiscountCode.message??'', "", context);
    }else{
      toastFail(setDiscountCode.message??'', "", context);
    }

    // discountCodeResult=setDiscountCode.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar("کد تخفیف "),
      body:
        Container(
          height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/banner.jpg"),
    fit: BoxFit.cover),
    ),child: Container(
          height: 300,
        margin: const EdgeInsets.only(bottom: 10, right: 15, left: 15,top: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3))
            ]),
        padding: const EdgeInsets.only(left: 18, right: 18, top: 15),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1))
                  ]),
              padding: const EdgeInsets.all( 10),
              child: const Text("محل نمایش کد تخفیف"),
            ),
            Center(
              child:   textInput(' کد تخفیف دریافت شده را وارد کنید... ', enterDiscountController, Icons.discount),
            ),
            Container(
              height: 55,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(140, 48),
                          backgroundColor: mainColor,
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      onPressed: () async {
                        setState(() {
                          if(enterDiscountController.text.isEmpty){
                            toastFail("لطفا کد تخفیف را وارد کنید", "", context);
                          }else{
                            setDiscountCode();


                          }
                        });
                      },
                      child: const Text('اعمال کد تخفیف',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(140, 48),
                          backgroundColor: mainColor,
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      onPressed: () async {

                        setState(() {
                        });
                      },
                      child: const Text('انصراف',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            )
          ],
        ),
      ),)
    );
  }
}
