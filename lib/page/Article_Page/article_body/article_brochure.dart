import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starlife/page/Article_Page/article_detail_page/article_detail_page.dart';
import 'package:starlife/controllers/home_controller.dart';
import 'package:starlife/controllers/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ArticleBrochure extends StatefulWidget {
  const ArticleBrochure({super.key});

  @override
  State<ArticleBrochure> createState() => _ArticleBrochureState();
}

class _ArticleBrochureState extends State<ArticleBrochure> {
  final c = Get.put(GlobalController());
  final controller = PageController(viewportFraction: 1, keepPage: true);
  // List<Artikel> articels = [
  //   Artikel(id: "01", title: "Kenali dan Pahami 10 Tanda Masalah Gigi & Mulut", image: "assets/images/img_artikel.png"),
  //   Artikel(id: "02", title: "Koreksi Gangguan Penglihatan dengan Lensa Kontak", image: "assets/images/img_artikel2.png"),
  //   Artikel(id: "03", title: "Kenali Tanda-Tanda Mata Kamu Sedang Bermasalah", image: "assets/images/img_artikel3.png"),
  // ];

  final h = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    h.getDataNews();
    // loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Positioned(
      //   top: 0,
      //   child: Container(
      //     height: 680,
      //     width: Get.width,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       border: Border.all(color: Colors.black
      //       )
      //     ),
      //   ),
      // ),
      Positioned(
        top: -450,
        left: -210,
        child: Container(
          width: 844,
          height: 844,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: OPrimaryColor),
        ),
      ),
      Positioned(
          top: -230,
          left: -100,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(400)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                width: 600,
                height: 600,
                'assets/icon/ic_logo_crop.png',
                // color: Colors.white.withOpacity(0.15),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          )),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 53,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Artikel Kesehatan").p16b().white(),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(children: [
            SizedBox(
              height: 400,
              width: Get.width,
              child: PageView.builder(
                controller: controller,
                itemCount: h.listNews.length,
                // allowImplicitScrolling: true,
                // pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ArticleDetailPage(news: h.listNews[index]));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black,
                                ],
                              ),
                            ),
                            width: Get.width - 32,
                            height: 400,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset("assets/images/img_artikel1.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 266,
                              ),
                              SizedBox(width: 254, height: 54, child: Text(h.listNews[index].title).p18b().white()),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                                    child: Container(
                                      color: Colors.white,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.asset(
                                          width: 20,
                                          height: 20,
                                          'assets/images/img_small_logo.png',
                                          // color: Colors.white.withOpacity(0.15),
                                          colorBlendMode: BlendMode.modulate,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text("Starlife Medical Center ").p10m().white(),
                                  const Text("• ").p10m().white(),
                                  const Text("1 Menit yang lalu ").p10m().white()
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 350,
                ),
                SizedBox(
                  width: Get.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(activeDotColor: Colors.white, dotHeight: 8, spacing: 6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    ]);
  }
}

class Artikel {
  final String id;
  final String title;
  final String image;

  Artikel({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  String toString() {
    return '{ $title, $id }';
  }
}
