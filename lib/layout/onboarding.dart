import 'package:flutter/material.dart';
import 'package:untitled3/layout/home_screen.dart';
import 'package:untitled3/shared/cash_helper.dart';
import 'package:untitled3/shared/components/components.dart';

class OnBoardingScreen extends StatelessWidget {
  PageController onBoardingController = PageController();

  List<List<String>> headline = [
    [
      'استمع',
      'تمعن',
      'تحصن',
    ],
    [
      'باورادك صوتيا وبدون انترنت',
      'الاذكار وعش لحضات إيمانه',
      'بالاذكار في يومك وليلتك',
    ],
  ];

  List<String> images = [
    'habib1.jpg',
    'habib2.jpg',
    'habib3.jpg',
  ];
  bool isLast = false;

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        if (value == images.length - 1) {
          isLast = true;
        } else {
          isLast = false;
        }
      },
      controller: onBoardingController,
      itemCount: images.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.only(right: 20),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  CacheHelper.saveData(key: 'ShowOnBoard', value: false)
                      .then((value) {
                    if (value) navigateAndReplacement(context, HomePage());
                  });
                },
                child: const Text(
                  'تخطي',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: List.generate(
                                3,
                                (indexDots) => Container(
                                      margin: const EdgeInsets.only(bottom: 2),
                                      width: 8,
                                      height: index == indexDots ? 25 : 8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: index == indexDots
                                            ? Colors.brown
                                            : Colors.brown.shade300,
                                      ),
                                    )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                headline[0][index],

                                style:const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                headline[1][index],maxLines: 2,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown.shade300),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/${images[index]}'),
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (isLast) {
                CacheHelper.saveData(key: 'ShowOnBoard', value: false)
                    .then((value) {
                  if (value) navigateAndReplacement(context, HomePage());
                });
              } else {
                onBoardingController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },backgroundColor: Colors.brown,
            elevation: 20,
            child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
          ),
        );
      },
    );
  }
}
