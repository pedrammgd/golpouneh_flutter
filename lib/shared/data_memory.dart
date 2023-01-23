import 'dart:io';

import 'package:gol_pouneh/models/blog_article.dart';
import 'package:gol_pouneh/models/company_model.dart';
import 'package:gol_pouneh/models/product.dart';
import '../models/address.dart';
import '../models/advert.dart';
import '../models/category.dart';
import '../models/city.dart';
import '../models/drop_down.dart';
import '../models/profile.dart';

mixin DataMemory {
  static File? avatarFile;
  static late String userId;
  static ProfileModel? profile;
  static bool isOnline = true;
  static late bool isFirstTime;
  static late CompanyModel companyModelDetails;
  static late int supplierId;
  static late String supplierName;
  static late String supplierAddress;
  static String? geoLocation;
  static String?  latitude;
  static String?  longitude;
  static bool  getWithUrSelf=false;
  static bool  sendToMe=false;
  static bool  activePayBtn=false;
  // Cart
  static int factorId = 0;
  static int numberOfOrder = 0;
  // DropDown
  static List<DropDownModel> states = [];
  static List<CityModel> cities = [];

  // Blogs
  static List<BlogArticleModel> blogArticles = [];
  static List<BlogArticleModel> recipes = [];

  // Adverts
  static List<AdvertModel> adverts = [];

  // Addresses
  static List<AddressModel> addresses = [];

  // Categories
  static List<CategoryModel> categories = [];

  // Products
  static List<ProductModel> newProducts = [];
  static List<ProductModel> bestSellingProducts = [];


}
