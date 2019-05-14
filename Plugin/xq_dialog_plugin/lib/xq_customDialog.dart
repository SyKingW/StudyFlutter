import 'package:flutter/material.dart';

// 自定义对话框
// ignore: must_be_immutable
class XQLoadingDialog extends Dialog {
  String text;

  XQLoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center(
        //保证控件居中效果
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 自定义对话框
class XQInputDialog extends AlertDialog {
  String text;
  String message;

  XQInputDialog({Key key, @required this.text, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 报警目前..不知道怎么解决
    return AlertDialog(
      title: Text(text),
      content: Container(
          // width: 200,
          // height: 150,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[Text(message), TextField(), TextField()],
            )
          )),
      actions: <Widget>[
        SimpleDialogOption(
          child: Text("确定"),
          onPressed: () {
            print("确定");
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}