import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

class XQTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: TabBar(
        tabs: <Widget>[Text("0qwejlk"), Text("1"), Text("2qwejqkw\nqweuqweiqjlk"), Text("3qwehqwkjehaksd"), Text("3qwehqwkjehaksd"), Text("3qwehqwkjehaksd")],
        indicatorColor: Colors.red,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.blue,
        controller: TabController(length: 6, vsync: XQTickerProvider()),
        isScrollable: true,
        onTap: (value) {
          print(value);
        },
      ),
    );



  }

// @override
// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TabBar"),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[Text("这是一个TabBar")],
//         ),
//       ),
//     );
//   }

}

class XQTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(onTick) {
    Ticker ticker = Ticker(onTick);

    return ticker;
  }
}
