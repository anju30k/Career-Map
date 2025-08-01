import 'package:career_map/companySpecific.dart';
import 'package:career_map/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:career_map/companyModel.dart';

class MainApp extends StatefulWidget {
  bool isLogged = false;
  MainApp({super.key, bool? isLogged});

  @override
  State createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filterList = companyList; // Initially, show all items
    searchController.addListener(_filterList);
  }

  void _filterList() {
    setState(() {
      filterList = companyList
          .where((item) => item.companyName
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool _showSearchField = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        title: _showSearchField
            ? TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
                autofocus: true,
              )
            : const Text(
                'Our Recruiters',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _showSearchField ? Icons.close : Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _showSearchField = !_showSearchField;
                if (!_showSearchField) {
                  filterList = companyList; // Reset list when search is closed
                  searchController.clear();
                }
              });
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.login, color: Colors.black, size: 30),
                onPressed: () {
                  setState(() {
                    widget.isLogged = true;
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const AuthPage();
                    }));
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CompanyInfo(
                              comp: companyList[index],
                            )));
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Container(
                        height: screenHeight * 0.13,
                        width: screenWidth * 0.90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent.withOpacity(0.2),
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                              color: const Color.fromARGB(255, 31, 43, 53),
                              width: 0.7),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filterList[index].companyName,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.1,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.3),
                                      color: cardColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            filterList[index].companyTag),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tentative visiting date",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "${filterList[index].year} :- ${filterList[index].month}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 62, 51, 51)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
