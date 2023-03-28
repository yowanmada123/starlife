import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlife/models/model_news.dart';
import 'package:starlife/page/Article_Page/article_detail_page/article_detail_brochure.dart';
import 'package:starlife/page/global_controller.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key, required this.news});
  final News news;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final c = Get.put(GlobalController());
  String text =
      " Tahukah kamu banyak dari kebiasaan yang kita lakukan sehari-hari ternyata berdampak buruk bagi kesehatan tubuh kita lho. Faktanya, banyak penyakit serius dapat diakibatkan oleh kebersihan mulut dan gigi yang buruk. Mulut dan gigi terdiri dari saraf yang menghubungkan mereka ke bagian lain dari organ. Maka bukan mitos bahwa masalah gigi dan mulut dapat menyebabkan penyakit serius seperti penyakit jantung, infeksi saluran pernapasan, bahkan kanker. Munculnya masalah gigi dan mulut bisa disebabkan oleh kebiasaan buruk yang mungkin tidak anda sadari. Penting untuk menghentikan kebiasaan buruk ini untuk menghindari risiko penyakit terkait gigi dan mulut. Mau tahu kebiasaan apa saja yang dapat merusak kesehatan gigi? Yuk, simak penjelasan selengkapnya. Menggigit kuku Kebiasan menggigit kuku biasanya kerap dilakukan ketika seseorang sedang berpikir, menunggu, malu, bosan, frustasi, cemas, bahkan stres. Namun jika ditinjau dari segi kesehatan mengigit kuku tidak hanya menyebarkan bakteri ke mulut, tetapi juga mengikis email gigi dan melemahkan gigi depan. Selain itu juga dapat berakibat terjadinya disfungsi rahang jika dilakukan dalam waktu yang lama. Menyikat Gigi Terlalu Keras Menyikat gigi memiliki banyak manfaat salah satunya adalah mencegah gigi berlubang dan bau mulut. Cara menyikat gigi yang benar adalah dengan gerakan melingkar selama 20 detik di setiap bagian secara perlahan. Menyikat dengan sikat gigi yang keras, atau menyikat terlalu keras, dapat merusak gigi dan mengiritasi gusi. Menggeretakkan Gigi Umumnya, kebiasaan ini terbentuk karena stres dan kecemasan. Kebiasaan ini tidak hanya merugikan diri sendiri tetapi juga orang lain. Karena kebiasaan mengatupkan atau menggemeretakkan gigi bisa menimbulkan bunyi yang tidak enak di telinga. Gigi yang terus-menerus tergores dapat menyebabkan gigi terkelupas atau retak, serta nyeri otot atau nyeri sendi. Kebiasaan ini. Mengunyah Es Batu Enamel adalah kristal dan Es juga kristal. Jika kamu membiarkan dua kristal bertabrakan, salah satunya pasti akan pecah, selain itu pecahan es juga bisa mengiritasi gusi kamu. Untuk menghindari hal tersebut sebaiknya pilih minuman dingin tanpa es atau gunakan sedotan untuk menghindari godaan kebiasaan ini. ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              ArticleDetailBrochure(news: widget.news,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: c.sw * 16, vertical: 0),
                child: Text(
                  widget.news.content,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height:    50,
              )
            ],
          )),
          // const TopBar()
        ],
      ),
    );
  }
}
