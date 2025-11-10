import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_text_field.dart';
import 'package:flutter/widgets.dart';

class TextFieldSection extends StatefulWidget {
  const TextFieldSection({super.key});

  @override
  State<TextFieldSection> createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 350,
          child: DiscordTextField(
            isDense: true,
            controller: _controller,
            hintText: 'Find a server',
            fillColor: ColorPalette.moreServersTextField,
            onChanged: (value) {
              locator<ServerCubit>().searchServers(value);
            },
          ),
        ),
      ],
    );
  }
}
