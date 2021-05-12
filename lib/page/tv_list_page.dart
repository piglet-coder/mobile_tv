import 'package:flutter/material.dart';
import 'package:mobile_tv/page/tv_live_page.dart';
import 'package:mobile_tv/resource/rtmp_address.dart';

/// @author zdl
/// date 2021/5/8 16:30
/// email zdl328465042@163.com
/// description tv列表页
class TvListPage extends StatelessWidget {
  const TvListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '频道列表',
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          String key = RtmpAddress.rtmpMap.keys.toList()[index];
          return InkWell(
            onTap: () {
              String rtmp = RtmpAddress.rtmpMap[key];
              print(rtmp);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TvLivePage(rtmp: rtmp),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                key,
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Color(0xffeaeaea),
          );
        },
        itemCount: RtmpAddress.rtmpMap.length,
      ),
    );
  }
}
