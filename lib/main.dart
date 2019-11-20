import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_screenutil_Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 初始化实例，默认宽：1080，高：1920  allowFontScaling:false
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    // 设置iPhone6 ​​(iPhone6 ​​750*1334)
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    // 根据系统设置字体进行缩放
    // ScreenUtil.instance =
    // ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
    //   ..init(context);

    print('设备的屏幕的 width:${ScreenUtil.screenWidth}');
    print('设备的屏幕的 height:${ScreenUtil.screenHeight}');
    print('Device pixel density:${ScreenUtil.pixelRatio}');
    print('Bottom safe zone distance:${ScreenUtil.bottomBarHeight}');
    print('Status bar height:${ScreenUtil.statusBarHeight}px');
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil.getInstance().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil.getInstance().scaleHeight}');
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_screenutil_Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 第一行
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 长方形
              Container(
                width: ScreenUtil.getInstance().setWidth(200),
                height: ScreenUtil.getInstance().setHeight(280),
                color: Colors.red,
                child: Text('设置红色'),
              ),
              // 正方形
              Container(
                width: ScreenUtil.getInstance().setWidth(280),
                height: ScreenUtil.getInstance().setWidth(280),
                color: Colors.green,
                child: Text('设置绿色'),
              )
            ],
          ),
          // 第二行
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
                width: ScreenUtil.getInstance().setWidth(375),
                height: ScreenUtil.getInstance().setHeight(200),
                color: Colors.red,
                child: Text(
                  'My width:${ScreenUtil.getInstance().setWidth(375)}dp',
                  style: TextStyle(
                      color: Colors.white,
                      // 不跟随系统字体变化
                      fontSize: ScreenUtil.getInstance().setSp(20)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
                width: ScreenUtil.getInstance().setWidth(375),
                height: ScreenUtil.getInstance().setHeight(200),
                color: Colors.blue,
                child: Text(
                    'My width:${ScreenUtil.getInstance().setWidth(375)}dp',
                    style: TextStyle(
                        color: Colors.white,
                        // 跟随系统字体变化
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(20))),
              ),
            ],
          ),

          ///当前设备宽度 dp
          Text('Device width:${ScreenUtil.screenWidth}px'),
          ///当前设备高度 dp
          Text('Device height:${ScreenUtil.screenHeight}px'),
          ///设备的像素密度
          Text('Device pixel density:${ScreenUtil.pixelRatio}'),
          ///底部安全区距离 dp
          Text('Bottom safe zone distance:${ScreenUtil.bottomBarHeight}px'),
          ///状态栏高度 dp 刘海屏会更高
          Text('Status bar height:${ScreenUtil.statusBarHeight}px'),
          
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(100),
          ),
          // 不跟随系统字体变化
          Text(
            "24px fontsize text",
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(24),
            ),
          ),
          // 跟随系统字体变化
          Text(
            "24px fontsize text",
            style: TextStyle(
              fontSize: ScreenUtil(allowFontScaling: true).setSp(24),
            ),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(100),
          ),
          Text('System font scaling factor:${ScreenUtil.textScaleFactory}'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'My font size is 14px on the design draft and will not change with the system.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil.getInstance().setSp(14),
                  )),
              Text(
                  'My font size is 14px on the design draft and will change with the system.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil(allowFontScaling: true).setSp(24),
                  )),
            ],
          )
        ],
      ),
    );
  }
}