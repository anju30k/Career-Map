// ignore: file_names
import 'package:flutter/material.dart';

class CompanyCard {
  String companyName;
  String companyTag;
  String year;
  String month;
  String companyImage;
  String founderName;
  String stockPrice;
  String location;
  String since;
  String about;
  CompanyCard(
      {required this.companyName,
      required this.companyTag,
      required this.year,
      required this.month,
      required this.companyImage,
      required this.founderName,
      required this.location,
      required this.since,
      required this.about,
      required this.stockPrice});
}

Color cardColor = Color.fromRGBO(69, 137, 245, 1);
Color backColor = Color.fromARGB(255, 245, 237, 234);
List<CompanyCard> companyList = [
  CompanyCard(
      companyName: "Accenture",
      companyTag: "assets/service.jpg",
      year: "Final year",
      companyImage: "assets/accenture.webp",
      month: "June",
      founderName: "Jeffrey Merrihue",
      location: "Pune",
      since: "1989",
      stockPrice: "62 B",
      about:
          "Accenture actively hires freshers through campus recruitment and various hiring programs, offering opportunities in consulting, technology, and digital services. They focus on training and skill development to prepare new graduates for client-facing roles."),
  CompanyCard(
      companyName: "EQTech",
      companyTag: "assets/product.webp",
      year: "Final year",
      companyImage: "assets/eqtech.png",
      month: "July",
      founderName: "Dinesh Khaladkar",
      location: "Pune",
      since: "1995",
      stockPrice: "750 M",
      about:
          "EQ Technologic hires fresh graduates from Sinhgad College, focusing on candidates with strong technical skills in software development and data management."),
  CompanyCard(
      companyName: "TCS",
      companyTag: "assets/service.jpg",
      year: "Final year",
      companyImage: "assets/tcs.jpg",
      month: "March",
      founderName: "J.R.D.Tata",
      location: "Pune",
      since: "1968",
      stockPrice: "27.18 B",
      about:
          "TCS hires freshers through its extensive campus recruitment drives and national-level tests like TCS NQT. The company offers roles in software development, IT services, and business process management, focusing on training new graduates to meet industry demands."),
  CompanyCard(
      companyName: "WordLine",
      companyTag: "assets/product.webp",
      year: "Third year",
      companyImage: "assets/wordline.jpeg",
      month: "March",
      founderName: "Gilles Grapinet",
      location: "pune",
      since: "1973",
      stockPrice: "50.34 B",
      about:
          "Worldline is a leading global provider of payment and transactional services, offering solutions for secure electronic payments and digital transactions. The company serves a wide range of industries, including banking, retail, and transportation, enabling seamless and efficient payment processing."),
];
List<CompanyCard> filterList = [];
void addCompany(CompanyCard card) {
  companyList.add(card);
}
