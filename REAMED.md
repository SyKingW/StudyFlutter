# 学习 Flutter 的记录








# 坑

## Android Flutter 安装

打开设置里的 Plugin, 然后搜索 Flutter, 下载就可以了

```
✗ Flutter plugin not installed; this adds Flutter specific functionality.
✗ Dart plugin not installed; this adds Dart specific functionality.
```


# WARNING: API 'variant.getMergeAssets()'

# WARNING: API 'variantOutput.getProcessResources()'

```

WARNING: API ‘variant.getJavaCompile()’ is obsolete and has been replaced with ‘variant.getJavaCompileProvider()’.
It will be removed at the end of 2019.

WARNING: API ‘variantOutput.getPackageApplication()’ is obsolete and has been replaced with ‘variant.getPackageApplicationProvider()’.
It will be removed at the end of 2019.

```

我们暂时无需理会，等待依赖库更新即可。  
如果强迫症看着实在难受，可暂时将根目录中build.gradle中的  
classpath 'com.android.tools.build:gradle:3.3.0’  
版本修改为以前的版本（如：3.2.1），就不会出现这个警告了。  

https://blog.csdn.net/yuzhiqiang_1993/article/details/86576718



## Widget 生命周期

Widget 没有 viewWillAppear 这些生命周期, 起码我是未找到

不过倒是有下面这种方法监听跳转回来

```dart
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
```


## App 生命周期


```dart

// 要继承这个 WidgetsBindingObserver

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
  
```



