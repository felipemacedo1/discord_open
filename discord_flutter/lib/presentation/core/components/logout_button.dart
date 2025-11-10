import 'package:auto_route/auto_route.dart';
import 'package:discord_flutter/application/auth/auth_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.isLoggedIn != current.isLoggedIn,
      listener: (context, state) {
        if (state.isLoggedIn == false) {
          _resetCubits();

          context.router.replacePath('/login');
        }
      },
      child: DiscordIconButton.filled(
        tooltip: 'Log out',
        backgroundColor: ColorPalette.error,
        onPressed: () {
          locator<AuthCubit>().signOut();
        },
        icon: Icon(
          Icons.exit_to_app,
          color: ColorPalette.white,
        ),
      ),
    );
  }

  void _resetCubits() {
    locator<ChatCubit>().resetToInitial();
    locator<ServerCubit>().resetToInitial();
    locator<UserCubit>().resetToInitial();
    locator<LiveStreamCubit>().resetToInitial();
    locator<MemberCubit>().resetToInitial();
    locator<SearchCubit>().resetToInitial();
  }
}
