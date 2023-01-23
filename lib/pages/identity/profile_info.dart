import 'dart:io';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/services/profile.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:gol_pouneh/shared/text_input.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/profile.dart';
import '../../models/result_operation.dart';
import '../../services/account.dart';
import '../../shared/toast.dart';
import '../../shared/url.dart';

class ProfileInfoState extends State<ProfileInfo> {
  bool isLoading = false;
  bool profileLoading = false;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController titleOfOrganizationController;
  File? file;
  double opacity = 0;
  late File imageFile;
  late String profileImageName;
  XFile? pickedFile;
  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: DataMemory.profile!.firstName);
    lastNameController = TextEditingController(text: DataMemory.profile!.lastName);
    emailController = TextEditingController(text: DataMemory.profile!.email);
    titleOfOrganizationController =
        TextEditingController(text: DataMemory.profile!.titleOrganization ?? "");
    getProfileImage();
  }

  /*void getAvatar() async {
    ProfileService prof = ProfileService();
    await prof.profileImage();
    setState(() {
      opacity = 1;
    });

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('اطلاعات حساب'),
        backgroundColor: backgroundColor,
        body: Container(
            padding: const EdgeInsets.only(top: 20),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
            ),
            child: isLoading
                ? Loading.circular()
                : SingleChildScrollView(
              primary: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
              profileLoading?Loading.circular()
             : InkWell(
                      child: Container(width: 120,height: 120,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child:
                              CachedNetworkImage(
                                 imageUrl: imageUrlProfile+profileImageName.replaceAll('\\', '/'),
                                imageBuilder: (context, imageProvider) => Container(
                                     decoration: BoxDecoration(
                                         image: DecorationImage(
                                             image: imageProvider, fit: BoxFit.cover))),
                                 placeholder: (context, url) => SizedBox(
                                     height: MediaQuery.of(context).size.height,
                                     width: MediaQuery.of(context).size.width,
                                     child: Loading.circular(mainColor)),
                                 errorWidget: (context, url, error) {
                                   debugPrint(error.toString());
                                   return const SizedBox(height: 110, width: 110);
                                 }))
                      ),
                      onTap: (){
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          // false = user must tap button, true = tap outside dialog
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.browse_gallery, color: Colors.amber[900],),
                                        TextButton(
                                          onPressed: (){
                                            getFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("انتخاب از گالری", style: TextStyle(color: Colors.black,)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.camera_alt, color: Colors.amber[900],),
                                        TextButton(
                                          onPressed: (){
                                            getFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("انتخاب از دوربین", style: TextStyle(color: Colors.black,)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                     //   : const CircularProgressIndicator(),
                    textInput("نام", firstNameController, AntIcons.userOutlined),
                    textInput(
                        "نام خانوادگی", lastNameController, AntIcons.userOutlined),
                    textInput("ایمیل", emailController, AntIcons.mailOutlined,
                        TextInputType.emailAddress),

                    textInput('عنوان سازمانی(اختیاری)',
                        titleOfOrganizationController, Icons.home_work_outlined),
                    const SizedBox(height: 30,),
                    submit()
                  ]),
            )));
  }

  Widget submit() {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: dangerColor),
            width: 200,
            height: 50,
            margin: const EdgeInsets.only(bottom:15 ),
            alignment: Alignment.center,
            child: const Text("اعمال تغییرات",
                style: TextStyle(
                    color: titleColor, fontSize: 17, fontWeight: FontWeight.bold))),
        onTap: () async {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Wrap(
                  children: const [
                    Icon(
                      Icons.change_circle,
                      color: Colors.green,
                    ),
                    Text(
                      'آیا از ایجاد تغییرات اطمینان دارید؟',
                    ),
                  ],
                ),
                content: const Text(
                    'این کار باعث میشود نمایه شما تغییر داده شود لطفا قبل از تایید بررسی نمایید.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('تایید'),
                    onPressed: () {
                      doChange();
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('لغو'),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
  }

  doChange() async {
    setState(() {
      isLoading = true;
    });
    ProfileModel model = ProfileModel(
        id: DataMemory.profile!.id,
        phoneNumber: DataMemory.profile!.phoneNumber,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        userName: DataMemory.profile!.userName,
        isMale: DataMemory.profile!.isMale ?? false,
        registerDate: DataMemory.profile!.registerDate,
        titleOrganization: titleOfOrganizationController.text);
    ResultOperation result = await AccountService().editProfileInfo(model);
    if (!mounted) return;
    if (result.isSuccess == true) {
      DataMemory.profile = model;
      toastSuccess("موفقیت", "تغییرات با موفقیت انجام شد", context);
    } else {
      toastFail('عملیات با خطا مواجه شد', result.message ?? '', context);
    }
    setState(() {
      isLoading = false;
    });
  }
  getFromGallery() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      await ProfileService().profileImage(imageFile);
      await getProfileImage();
    }
  }
  void getFromCamera() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      await ProfileService().profileImage(imageFile);
      await getProfileImage();
    }
  }
  getProfileImage() async{
    setState(() {
      profileLoading=true;
    });
    var res= await ProfileService().downloadProfileImage();
    profileImageName=res!;
    setState(() {
      profileLoading=false;
    });
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileInfoState();
}
