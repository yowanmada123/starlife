import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/page/Article_Page/article_detail_page/article_detail_page.dart';
import 'package:starlife/page/Home_Page/home_controller.dart';
import 'package:starlife/page/global_controller.dart';
import 'package:starlife/utils/colors.dart';
import 'package:starlife/widget/ext_text.dart';

class ArticleRecommendations extends StatefulWidget {
  const ArticleRecommendations({super.key});

  @override
  State<ArticleRecommendations> createState() => _ArticleRecommendationsState();
}

class _ArticleRecommendationsState extends State<ArticleRecommendations> {
  final c = Get.put(GlobalController());
  final controller = PageController(viewportFraction: 1, keepPage: true);
  List<String> category = [
    'Semua',
    'Kesehatan Anak',
    'Kesehatan Ibu Hamil',
    'Kesehatan Gigi',
  ];
  List<Artikel> articels = [
    Artikel(id: "01", title: "Kenali dan Pahami 10 Tanda Masalah Gigi & Mulut", image: "assets/images/img_artikel.png"),
    Artikel(id: "02", title: "Koreksi Gangguan Penglihatan dengan Lensa Kontak", image: "assets/images/img_artikel2.png"),
    Artikel(id: "03", title: "Kenali Tanda-Tanda Mata Kamu Sedang Bermasalah", image: "assets/images/img_artikel3.png"),
  ];
  int selectedIndex = 0;

  final h = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    h.getDataNews();
    // loading.value = false;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: c.sh * 20),
          child: const Text("Rekomendasi Artikel").p16b().black(),
        ),
        Container(
          height: 22,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: c.sw*16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int itemIndex) => Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = itemIndex;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: selectedIndex == itemIndex ? OPrimaryColor : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: OPrimaryColor)),
                    // width: c.sw * 81,
                    child: Center(
                        child: Text(
                      category[itemIndex],
                      style: TextStyle(
                        color: selectedIndex == itemIndex ? Colors.white : OPrimaryColor,
                      ),
                    ).p12r()),
                  ),
                ),
                SizedBox(
                  width: c.sw * 10,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: c.sh * 20,
        ),
        SizedBox(
          width: Get.width,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: h.listNews.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int itemIndex) => itemIndex == 2
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ArticleDetailPage(news:h.listNews[itemIndex]));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(articels[0].image),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: c.sw * 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                          width: c.sw * 258,
                                          child: Text(
                                            h.listNews[itemIndex].title,
                                            style: const TextStyle(height: 1.5),
                                          ).p14b().black()),
                                      Positioned(
                                        bottom: 0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.timelapse_rounded,
                                              color: Colors.grey,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: c.sw * 10,
                                            ),
                                            const Text(
                                              "21 minutes ago • Admin",
                                              style: TextStyle(height: 1.5),
                                            ).p10r().grey(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: c.sh * 50,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ArticleDetailPage(news:h.listNews[itemIndex]));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.asset(articels[0].image),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: c.sw * 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                          width: c.sw * 258,
                                          child: Text(
                                            h.listNews[itemIndex].title,
                                            style: const TextStyle(height: 1.5),
                                          ).p14b().black()),
                                      Positioned(
                                        bottom: 0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.timelapse_rounded,
                                              color: Colors.grey,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: c.sw * 10,
                                            ),
                                            const Text(
                                              "1 minutes ago • Admin",
                                              style: TextStyle(height: 1.5),
                                            ).p10r().grey(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: c.sh * 10,
                      ),
                    ],
                  ),
          ),
        )
      ],
    );
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
