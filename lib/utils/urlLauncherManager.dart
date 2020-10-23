import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherManager {

  ///用于跳转到平台拨打电话
  ///[number]=>通话人手机号码

  static Future<void> MakePhoneCall(String number) async {
    String url = "tel:" + number;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ///用于跳转到平台发送短信
  ///[number]=>收信人手机号码
  static Future<void> SendMessage(String number) async {
    String url = "sms:" + number;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ///用于跳转到平台默认浏览器访问网站url
  ///[url]=>用于访问的网站，http://... 或 https://...
  static Future<bool> BrowseWeb(String url) async {

    if (await canLaunch(url)) {
      bool result = await launch(url);
      return result;
    } else {
      throw 'Could not launch $url';
    }
  }

  ///用于跳转到手机平台默认发送邮件的界面
  ///[address]=>收件人邮箱
  ///[subject]=>邮件标题
  ///[body]=>邮件内容
  static Future<void> SendEmail(String address,String subject,String body) async{
    String imformation = "mailto:$address?subject=$subject&body=$body";

    if (await canLaunch(imformation)) {
    await launch(imformation);
    } else {
    throw 'Could not launch $imformation';
    }
  }

  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                  onWillPop: () => new Future.value(false),
                  child: Center(
                    child: new CupertinoActivityIndicator(),
                  )));
        });
  }

}
