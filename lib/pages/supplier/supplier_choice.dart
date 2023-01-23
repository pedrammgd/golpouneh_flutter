import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/category.dart';
import '../../models/company_model.dart';
import '../../services/location.dart';
import '../../shared/appbar.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';

class SupplierChoice extends StatefulWidget {
  final bool fromFinalaize;
  const SupplierChoice(this.fromFinalaize, {Key? key}) : super(key: key);

  @override
  State<SupplierChoice> createState() => _SupplierChoiceState();
}

class _SupplierChoiceState extends State<SupplierChoice>
    with SingleTickerProviderStateMixin {
  dynamic row1;
  dynamic shopName;
  dynamic code;
  dynamic phoneNumber;
  dynamic address;
  late List<CompanyModel> listDetails;
  dynamic locationDetail;
  dynamic listOfLenght;
  var isLoading = true;
  dynamic object;

  bool isLoading1 = true;
  List tabs = [];
  List tabs2 = [];
  List lastList = [];
  List response = [];
  CategoryModel? categoryModel1;
  int catIndex = 0;
  TabController? tabController;
  int orderProductCount = 0;
  int orderProductCount1 = 0;
  List<bool> isChanging = [];
  List<CompanyModel> products = [];
  var pageNumber = 0;
  List<CompanyModel> repList = [];
  List<CompanyModel> branchList = [];

  @override
  void initState() {
    super.initState();
    getListOfCompany();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: appBarLocation('شعب و نمایندگی ها', context),
        body: Container(
            padding: const EdgeInsets.only(top: 5,bottom: 10),
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
            ),
            child: isLoading
                ? Loading.circular()
                : SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < branchList.length; i++)
                    i == 0 ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text("شعب", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        row(branchList[i], i),
                      ],
                    ) : row(branchList[i], i),
                  for (int ind = 0; ind < repList.length; ind++)
                    ind == 0 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text("نمایندگی ها", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        row(repList[ind], ind),
                      ],
                    ) : row(repList[ind], ind),
                ],
              ),
            )
          // : ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       itemCount: listOfLenght,
          //       itemBuilder: (BuildContext context, int index) {
          //         object = listDetails.elementAt(index);
          //         return row(listDetails[index], index);
          //       },
          //     ),
        ),
      ),
    );
  }

  Widget row(CompanyModel model, int index) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: const BoxDecoration(
          color: homeBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // detailsRow("ردیف :",index.toString() ),
            detailsRow("نام شعب یا نمایندگی:", model.companyName, Icons.factory),
            const SizedBox(
              height: 8,
            ),
            //detailsRow("کد :", model.supplierCode),
            detailsRow("شماره تماس:", model.phoneNumber, Icons.phone),
            const SizedBox(
              height: 8,
            ),
            detailsRow("نشانی:", model.address, Icons.location_city),
          ],
        ),
      ),
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int supplierId = model.id!.toInt();
        String supplierName = model.companyName!;
        String supplierAddress = model.address!;
        prefs.setInt('supplierId1', supplierId);
        prefs.setString('supplierName1', supplierName);
        prefs.setString('supplierAddress1', supplierAddress);
        DataMemory.companyModelDetails = model;
        setState(() {
          DataMemory.supplierId = prefs.getInt('supplierId1')!;
          DataMemory.supplierName = prefs.getString('supplierName1')!;
          DataMemory.supplierAddress = prefs.getString('supplierAddress1')!;
          var supId = prefs.getInt('supplierId1')!;
          DataMemory.supplierId = supId;
          var supName = prefs.getString('supplierName1');
          DataMemory.supplierName = supName!;
          var supAddress = prefs.getString('supplierAddress1')!;
          DataMemory.supplierAddress = supAddress;
        });
        int count = 0;
        if(widget.fromFinalaize){ navigateTo((){
          Navigator.of(context).popUntil((_) => count++ >= 1);
        });}

      },
    );
  }

  navigateTo(Function doThing){
    doThing();
  }

  Widget detailsRow(String title, details, icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon == Icons.phone
                ? InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 3),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: mainColor,
                ),
              ),
              onTap: () {
                dialNumber(phoneNumber: details, context: context);
              },
            )
                : Icon(
              icon,
              color: mainColor,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
              details ?? '',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
            )),
      ],
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

  getListOfCompany() async {
    response = await LocationService().setCompany(10, 1);
    tabs = response.where((x) => x.cityId != null).toList();

    if (tabs.isNotEmpty) {
      for (var i in tabs) {
        CompanyModel comapany = i;
        City? city = comapany.city;
        var cityState = city?.state;
        var obj3 = cityState["Title"].toString();
        tabs2.add(obj3);
      }
    }
    tabController = TabController(vsync: this, length: tabs.length);
    // getData1(pageNumber,  tabs[catIndex]);
    setState(() {
      isLoading1 = false;
    });

    //OLD
    var response1 = await LocationService().setCompany(10, 1);
    listDetails = response1;
    for (var i in listDetails) {
      if (i.companyName!.contains("شعبه")) {
        branchList.add(i);
      } else {
        repList.add(i);
      }
    }
    listDetails.sort((a, b) =>
    b.companyName == "شعبه" ? listDetails.indexOf(a) : listDetails.indexOf(a));

    listOfLenght = listDetails.length;
    setState(() {
      isLoading = false;
    });
  }
}
