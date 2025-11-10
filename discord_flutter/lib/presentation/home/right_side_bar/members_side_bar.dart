import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/components/profile_card.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MembersSideBar extends StatelessWidget {
  const MembersSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit, MemberState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return ListView.builder(
            itemCount: 10, // Show 10 skeleton items while loading
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: MemberItemSkeleton(),
              );
            },
          );
        }

        return ListView.builder(
          itemCount: state.members.length,
          itemBuilder: (context, index) {
            final member = state.members[index];

            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0),
              child: MemberItem(member: member),
            );
          },
        );
      },
    );
  }
}

class MemberItemSkeleton extends StatelessWidget {
  const MemberItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar skeleton
        DiscordIconButton.filled(
          onPressed: () {},
          icon: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorPalette.primaryVariantTwo,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 24,
              height: 24,
            ),
          ),
        ),
        SizedBox(width: 8),
        // Username skeleton
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorPalette.primaryVariantTwo,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SizedBox(
              height: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class MemberItem extends StatelessWidget {
  final DiscordUser member;
  const MemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final hasImage = member.userInfo?.imageUrl != null;

    return Row(
      children: [
        DiscordIconButton.filled(
          tooltip: 'Open Profile',
          onPressed: () {
            final isCurrentUser =
                member.id == locator<UserCubit>().state.user.id;

            showDialog(
              context: context,
              builder: (context) => ProfileCard(
                user: member,
                isCurrentUser: isCurrentUser,
              ),
            );
          },
          icon: hasImage
              ? CircleAvatar(
                  backgroundImage:
                      NetworkImage(member.userInfo?.imageUrl ?? ''),
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
        Text(
          member.userInfo?.userName ?? '',
          style: locator<FontStyles>().usernameStyle,
        ),
      ],
    );
  }
}
