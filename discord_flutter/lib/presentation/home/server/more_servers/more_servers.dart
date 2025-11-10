import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/home/server/more_servers/widgets/more_server_item.dart';
import 'package:discord_flutter/presentation/home/server/more_servers/widgets/more_servers_app_bar.dart';
import 'package:discord_flutter/presentation/home/server/more_servers/widgets/text_field_section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoreServers extends StatelessWidget {
  const MoreServers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: ColorPalette.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MoreServersAppBar(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFieldSection(),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MoreServerItem(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
