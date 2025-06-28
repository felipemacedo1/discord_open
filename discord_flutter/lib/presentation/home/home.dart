import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/presentation/core/widgets/side_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(child: AutoRouter()),
        ],
      ),
    );
  }
}
