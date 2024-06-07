import 'package:flutter/material.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key, String? username, });
  @override
  State<homeScreen> createState() => Homepage();
}

class Homepage extends State<homeScreen>
    with TickerProviderStateMixin {
 late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: TabBar(
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(30),
          labelPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          tabs: <Widget>[
            Tab(
                text: 'Physical',
              ),
              Tab(
                text: 'Mental',
              ),
              Tab(
                text: 'Financial',
              ),
          ]
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: Text("It's cloudy here"),),
          Center(child: Text("It's rainy here"),),
          Center(child: Text("It's sunny here"),),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}