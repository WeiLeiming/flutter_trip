import 'package:flutter/material.dart';

/// 语音识别
class SpeakPage extends StatefulWidget {
  @override
  _SpeakPageState createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin {
  String speakTips = '长按说话';
  String speakResult = '';
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _topItem(),
              _bottomItem(),
            ],
          ),
        ),
      ),
    );
  }

  _topItem() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Text(
            '你可以这样说',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          '故宫门票\n北京一日游\n迪士尼乐园',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            speakResult,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  _bottomItem() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTapDown: (e) {
              _speakStart();
            },
            onTapUp: (e) {
              _speakStop();
            },
            onTapCancel: () {
              _speakCancel();
            },
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      speakTips,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: MIC_SIZE,
                        width: MIC_SIZE,
                      ),
                      Center(
                        child: AnimatedMic(
                          animation: animation,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _speakStart() {
    controller.forward();
  }

  _speakStop() {
    controller.reset();
    controller.stop();
  }

  _speakCancel() {
    _speakStop();
  }
}

const double MIC_SIZE = 80;

class AnimatedMic extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1, end: 0.5);
  static final _sizeTween = Tween<double>(begin: MIC_SIZE, end: MIC_SIZE - 20);

  AnimatedMic({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(MIC_SIZE / 2),
        ),
        child: Icon(
          Icons.mic,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
