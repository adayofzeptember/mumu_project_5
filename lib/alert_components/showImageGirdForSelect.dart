import 'package:flutter/material.dart';
import 'package:mumu_project/ETC/FormSearch.dart';
import 'package:mumu_project/ETC/mediaQuery_set%202.dart';

Future<String> showImageGirdForSelect(BuildContext context, String title) async {
  List<String> mockData = [
    "สินค้า 1",
    "สินค้า 2",
    "สินค้า 3",
    "สินค้า 4",
    "สินค้า 5",
    "สินค้า 6",
    "สินค้า 7",
    "สินค้า 8",
    "สินค้า 9",
    "สินค้า 10",
    "สินค้า 11",
    "สินค้า 12",
    "สินค้า 13",
    "สินค้า 14",
    "สินค้า 15",
    "สินค้า 16",
    "สินค้า 17",
    "สินค้า 18",
    "สินค้า 19",
    "สินค้า 20",
  ];

  TextEditingController searchController = TextEditingController();

  String result = await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: setFontSize(context, 0.035), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25.0),
              FormSearch(
                onChanged: (value) {},
                controller: searchController,
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.spaceBetween,
                    spacing: 30.0,
                    children: [
                      for (var item in mockData)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, item);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 80.0,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.image),
                              ),
                              const SizedBox(height: 18),
                              SizedBox(
                                width: setWidth(context, 0.2),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: setFontSize(context, 0.03),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  return result;
}
