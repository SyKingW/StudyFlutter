import 'package:flutter/material.dart';

class XQOtherRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XQOtherRoute();
  }
}

// SingleTickerProviderStateMixin 是 TabController 的 vsync
class _XQOtherRoute extends State<XQOtherRoute>
    with SingleTickerProviderStateMixin {
  TabController tabCtl;

  @override
  void initState() {
    super.initState();
    this.tabCtl = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: this.tabCtl,
          children: <Widget>[
            XQBottomTabBarViewHome(),
            XQBottomTabBarViewRoom(),
            XQBottomTabBarViewMy()
          ],
        ),
        // Material 相当于一个背景这样
        bottomNavigationBar: Material(
            color: Colors.blueAccent,
            child: TabBar(
              tabs: <Tab>[
                Tab(
                  text: "房间",
                  icon: Icon(Icons.access_alarm),
                ),
                Tab(
                  text: "我的",
                  icon: Icon(Icons.my_location),
                ),
                Tab(text: "家", icon: Icon(Icons.accessible))
              ],
              labelColor: Colors.amber,
              unselectedLabelColor: Colors.black,
              controller: tabCtl,
            )),
        );
  }

  @override
  void dispose() {
    // 释放tabCtl ??? 这一步是否要做???
    this.tabCtl.dispose();
    super.dispose();
  }
}

class XQBottomTabBarViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQBottomTabBarViewHome"),
      ),
      body: Center(
        child: Text("XQBottomTabBarViewHome"),
      ),
    );
  }
}

class XQBottomTabBarViewRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQBottomTabBarViewRoom"),
      ),
      body: Center(
        child: Text("XQBottomTabBarViewRoom"),
      ),
    );
  }
}

class XQBottomTabBarViewMy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XQBottomTabBarViewMy"),
      ),
      body: Center(
        child: Text("XQBottomTabBarViewMy"),
      ),
    );
  }
}
