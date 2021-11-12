import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jupViec/widget/backgroundColor.dart';
import 'package:jupViec/widget/gradientColor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jupViec/widget/network_image.dart';

class HomePage extends StatelessWidget {
  List<String> images = [
    'https://media.jupviec.vn/resize/1920x686/files/news/2020/03/24/huong-dan-dat-lich-tong-ve-sinh-tren-ung-dung-jupviec-082719.jpg',
    'https://media.jupviec.vn/resize/1920x686/files/uploaded//news/1_1484045595997_ung-dung-jupviec-danh-cho-nguoi-phu-nu-hien-dai.png',
    'https://cdn-www.vinid.net/2020/04/1c413cdf-2020-04-24_giupviec_banner-web_1920x1080-1-scaled.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        flexibleSpace: backgroundColor(
            child: Container(color: Colors.white),
            colors: GradientColor.primaryGradient),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: GradientColor.primaryGradient)),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(16.0),
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: PNetworkImage(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      itemCount: 3,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: SwiperPagination(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
              children: <Widget>[
                svgIcon(assetName: 'assets/menu.svg', title: "asdds"),
                svgIcon(assetName: 'assets/menu.svg', title: "asdds"),
                svgIcon(assetName: 'assets/menu.svg', title: "asdds"),
                svgIcon(assetName: 'assets/menu.svg', title: "asdds"),
                svgIcon(assetName: 'assets/menu.svg', title: "asdds"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget svgIcon({String assetName, String title}) => Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: SvgPicture.asset(assetName, semanticsLabel: title),
            ),
            Flexible(
                child: Center(
              child: Text(title),
            ))
          ],
        ),
      );
}
