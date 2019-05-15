import 'package:flutter/material.dart';
import 'xq_lifeCycle_child.dart';

class Xq_lifeCycle extends StatefulWidget {
  @override
  Xq_lifeCycleView createState() {
    return Xq_lifeCycleView();
  }
}

class Xq_lifeCycleView extends Xq_lifeCycleState {
  @override
  void initState() {
    // 这个函数不属于生命周期，因为这个时候State的widget属性为空，如果要在构造函数中访问widget的属性是行不通的。但是构造函数必然是要第一个调用的。
    print("初始化 initState");
    super.initState();

// 添加程序声明周期的监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    // 当插入渲染树的时候调用，这个函数在生命周期中只调用一次。这里可以做一些初始化工作，比如初始化State的变量。
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    // 重新需要布局的时候, 例如横竖屏改动
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return _xq_build(context);
  }

  @override
  void deactivate() {
    // 视图出现和消失都会调用这个
    print('失去激活 deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('释放 dispose');
    // 记得移除监听
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void reassemble() {
    // 改动代码, 然后保存, 这个会执行..
    print('reassemble');
    super.reassemble();
  }

  /// WidgetsBindingObserver

  @override
  Future<bool> didPopRoute() {
    //路由弹出Future
    print('didPopRoute');
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    //新的路由Future
    print('didPushRoute');
    return super.didPushRoute(route);
  }

  @override
  void didChangeMetrics() {
    //系统窗口相关改变回调，例如屏幕旋转, 有电话打来等等
    print('didChangeMetrics');
    super.didChangeMetrics();
  }

  @override
  void didChangeTextScaleFactor() {
    // 文字系数变化
    print('didChangeTextScaleFactor');
    super.didChangeTextScaleFactor();
  }

  @override
  void didChangePlatformBrightness() {
    // 平台亮度??
    print('didChangePlatformBrightness');
    super.didChangePlatformBrightness();
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    //本地化语言变化
    print("didChangeLocales $locale");
    super.didChangeLocales(locale);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // APP生命周期....
    // 没有结束的周期
    // 而且也分不清楚是否是从后台进来...要自己去判断么???我的天.
    print("didChangeAppLifecycleState $state");
    switch (state) {
      case AppLifecycleState.resumed:
        {
          // 没有iOS分的那么细, 进入前台和已经被激活都会调用
          print("类似进入前台");
        }
        break;
      case AppLifecycleState.inactive:
        {
          // 但是从后台进入到前台这个也一样会触发
          print("被挂起, 双击Home状态");
        }
        break;
      case AppLifecycleState.paused:
        {
          print("进入后台");
        }
        break;

      case AppLifecycleState.suspending:
        {
          print("suspending");
        }
        break;

      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didHaveMemoryPressure() {
    // 低内存回调
    print("didHaveMemoryPressure");
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeAccessibilityFeatures() {
    // 当前系统改变了一些访问性活动的回调
    print("didChangeAccessibilityFeatures");
    super.didChangeAccessibilityFeatures();
  }
}

abstract class Xq_lifeCycleState extends State<Xq_lifeCycle>
    with WidgetsBindingObserver {
  int _btnCount = 0;

  void _xq_push() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new Xq_lifeCycle_child();
    })).then((onValue) {
      print(onValue);
      // 跳转回来
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() {
      // 跳转回来
      print("whenComplete");
    });
  }

  Widget _xq_build(BuildContext context) {
    var widgetList = [
      RaisedButton(
        child: Text("跳转"),
        onPressed: _xq_push,
      ),
      RaisedButton(
        child: Text("添加按钮"),
        onPressed: () {
          setState(() {
            _btnCount++;
          });
        },
      ),
      RaisedButton(
        child: Text("更新页面状态 只会更新build"),
        onPressed: () {
          setState(() {});
        },
      ),
    ];

    for (int i = 0; i < _btnCount; i++) {
      widgetList.add(RaisedButton(
        child: Text("更新页面状态 只会更新build"),
        onPressed: () {
          setState(() {});
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Xq_lifeCycle')),
      body: Center(
        child: Column(
          children: widgetList,
        ),
      ),
    );
  }
}
