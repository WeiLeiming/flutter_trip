import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://a3.att.hudong.com/68/61/300000839764127060614318218_950.jpg',
    'http://h.hiphotos.baidu.com/zhidao/pic/item/0dd7912397dda144dac4acc9b2b7d0a20df486f8.jpg',
    'http://a4.att.hudong.com/21/09/01200000026352136359091694357.jpg',
    'http://a2.att.hudong.com/36/48/19300001357258133412489354717.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                itemCount: _imageUrls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    _imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: SwiperPagination(),
              ),
            ),
            Container(
              height: 800,
              child: ListTile(
                title: Text('哈哈'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
