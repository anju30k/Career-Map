import 'package:career_map/PrepareOptions.dart';
import 'package:career_map/companyModel.dart';
import 'package:career_map/progressOfUserPage.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class CompanyInfo extends StatefulWidget {
  CompanyCard comp;
  CompanyInfo({
    super.key,
    required this.comp,
  });

  @override
  State createState() => CompanyInfoState();
}

class CompanyInfoState extends State<CompanyInfo> {
  Container availableDateContainer(
      String date, int index, double? ht, double? wid) {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.only(left: 14, top: 10, right: 2, bottom: 8),
      width: wid,
      height: ht,
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(121, 183, 255, 1), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: const Color.fromARGB(255, 255, 255, 255)),
      child: Text(
        date,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Container infoContainers(
      {String? heading, String? value, double? wid, double? ht}) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      width: wid,
      height: ht,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 212, 212, 212),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 7))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              heading!,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Color.fromRGBO(82, 82, 82, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            value!,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color.fromRGBO(121, 183, 255, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backColor,
      body: Stack(children: [
        SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 50, right: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.white),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 12,
                                  weight: 30,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          SizedBox(
                            child: Text(
                              widget.comp.companyName,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(widget.comp.companyImage),
                                fit: BoxFit.fitWidth)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 15, left: 25, top: 20),
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 328,
                        child: Text(
                          widget.comp.founderName,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 2, 2, 2),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "the Core Founder",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 106, 106, 106),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          infoContainers(
                              heading: "Since",
                              value: widget.comp.since,
                              wid: screenWidth * 0.27,
                              ht: screenHeight * 0.07),
                          const SizedBox(
                            width: 10,
                          ),
                          infoContainers(
                              heading: "Revenue",
                              value: widget.comp.stockPrice,
                              wid: screenWidth * 0.27,
                              ht: screenHeight * 0.07),
                          const SizedBox(
                            width: 10,
                          ),
                          infoContainers(
                              heading: "Location",
                              value: widget.comp.location,
                              wid: screenWidth * 0.27,
                              ht: screenHeight * 0.07),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 4, 4, 4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 328,
                            child: Text(
                              widget.comp.about,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 164,
                            child: Text(
                              "Working Days",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          availableDateContainer("Mon", 0, screenHeight * 0.045,
                              screenWidth * 0.16),
                          const SizedBox(
                            width: 5,
                          ),
                          availableDateContainer("Tue", 1, screenHeight * 0.045,
                              screenWidth * 0.16),
                          const SizedBox(
                            width: 5,
                          ),
                          availableDateContainer("Wed", 2, screenHeight * 0.045,
                              screenWidth * 0.16),
                          const SizedBox(
                            width: 5,
                          ),
                          availableDateContainer("Thu", 3, screenHeight * 0.045,
                              screenWidth * 0.16),
                          const SizedBox(
                            width: 5,
                          ),
                          availableDateContainer("Fri", 4, screenHeight * 0.045,
                              screenWidth * 0.16),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Working Time",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 16, 16, 16),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              availableDateContainer("09:00", 5,
                                  screenHeight * 0.045, screenWidth * 0.16),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "to",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              availableDateContainer("06:00", 6,
                                  screenHeight * 0.045, screenWidth * 0.16),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PlacementPreparationScreen();
                          }));
                        },
                        child: Container(
                          width: screenWidth * 0.86,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(121, 183, 255, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.26,
                                child: Text(
                                  "Let's Prepare",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Color.fromRGBO(252, 252, 252, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const UserProgressPage(
                              materialUsage: 0.3,
                              quizScore: 0.6,
                            );
                          }));
                        },
                        child: Container(
                          width: screenWidth * 0.86,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(121, 183, 255, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.32,
                                child: Text(
                                  "Check Progress",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Color.fromRGBO(252, 252, 252, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
