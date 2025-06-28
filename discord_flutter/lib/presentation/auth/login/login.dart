import 'package:auto_route/auto_route.dart';
import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: Center(
        child: SignInWithEmailButton(
          caller: locator<Client>().modules.auth,
          onSignedIn: () => context.router.replacePath('/loading'),
        ),
      ),
    );
  }
}
