import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class SearchResultItem extends StatelessWidget {
  final Message message;
  final String query;
  final bool isLoading;

  const SearchResultItem({
    super.key,
    required this.message,
    required this.query,
    required this.isLoading,
  });

  Widget _buildHighlightedText(String text) {
    if (query.isEmpty) return Text(text);

    final matches = RegExp(query, caseSensitive: false).allMatches(text);
    if (matches.isEmpty) return Text(text);

    final spans = <TextSpan>[];
    int lastIndex = 0;

    for (final match in matches) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: locator<FontStyles>().chatStyle,
        ));
      }

      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: locator<FontStyles>().chatStyle.copyWith(
              backgroundColor: ColorPalette.searchHighlight,
            ),
      ));

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: locator<FontStyles>().chatStyle,
      ));
    }

    return RichText(text: TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = message.senderInfo?.imageUrl != null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiscordIconButton.filled(
          backgroundColor: ColorPalette.primary,
          tooltip: 'Open Profile',
          onPressed: () {},
          icon: hasImage
              ? CircleAvatar(
                  backgroundImage:
                      NetworkImage(message.senderInfo?.imageUrl ?? ''),
                  radius: 12,
                )
              : SvgPicture.asset(
                  Assets.discordLogo,
                  fit: BoxFit.scaleDown,
                  height: 24,
                  width: 24,
                ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    message.senderInfo?.userName ?? '',
                    style: locator<FontStyles>().usernameStyle,
                  ),
                  if (!isLoading)
                    SizedBox(
                      width: 8,
                    ),
                  if (isLoading)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorPalette.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '                ',
                        style: locator<FontStyles>().chatDateStyle,
                      ),
                    )
                  else
                    Text(
                      DateFormat('h:mm a').format(message.timeStamp.toLocal()),
                      style: locator<FontStyles>().chatDateStyle,
                    ),
                ],
              ),
              if (isLoading)
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPalette.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('                                  ',
                      style: locator<FontStyles>().chatStyle),
                )
              else
                _buildHighlightedText(message.content)
            ],
          ),
        ),
      ],
    );
  }
}
