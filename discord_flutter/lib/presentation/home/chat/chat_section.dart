import 'dart:async';

import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/colors.dart';
import 'package:discord_flutter/presentation/core/components/discord_icon_button.dart';
import 'package:discord_flutter/presentation/core/components/discord_text_field.dart';
import 'package:discord_flutter/presentation/core/components/profile_card.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:discord_flutter/presentation/core/widgets/chat_app_bar.dart';
import 'package:discord_flutter/presentation/home/right_side_bar/right_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return Scaffold(
      body: ColoredBox(
        color: ColorPalette.primaryVariantTwo,
        child: Column(
          children: [
            if (isMobile)
              SizedBox(
                height: kToolbarHeight,
              ),
            ChatAppBar(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: const ChatList(),
                  ),
                  RightSideBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_paginationListener);
    _scrollToBottom();
    super.initState();
  }

  void _scrollToBottom() {
    Timer(
      const Duration(milliseconds: 200),
      () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + kToolbarHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  void _paginationListener() {
    final hasClients = scrollController.hasClients;
    final offset = scrollController.offset;

    // Toggle jump to present view when scroll hits the bottom (so user is viewing new messages)
    if (hasClients && scrollController.position.maxScrollExtent == offset) {
      final viewingOldMessages =
          locator<ChatCubit>().state.viewingOlderMessages;
      if (viewingOldMessages) {
        locator<ChatCubit>().setOlderMessageView(false);
      }
    }

    // Fetch chats when scroll hits the top (so user want to view previous messages)
    if (hasClients && scrollController.position.minScrollExtent == offset) {
      final isEnd = locator<ChatCubit>().state.endOfMessages;
      if (!isEnd) {
        locator<ChatCubit>().fetchChatsPaginated();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 480;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              BlocConsumer<ChatCubit, ChatState>(
                listenWhen: (previous, current) =>
                    previous.messages != current.messages,
                listener: (context, state) {
                  if (state.hasFetchedPagination &&
                      !state.viewingOlderMessages) {
                    locator<ChatCubit>().setOlderMessageView(true);
                  }

                  //TODO: [BUG]There needs to be a way to fix when the user types the message the chat should scroll down
                  //Hint: We can use userId from the UserCubit and check it against the Message senderId
                  if (!state.hasFetchedPagination) {
                    _scrollToBottom();
                  }
                },
                buildWhen: (previous, current) =>
                    previous.messages != current.messages ||
                    previous.isLoading != current.isLoading ||
                    previous.isPaginationLoading != current.isPaginationLoading,
                builder: (context, state) {
                  final groupedMessages = state.messages.entries;

                  if (state.isLoading) {
                    return LoadingChatList();
                  }

                  return CustomScrollView(
                      physics: ClampingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        if (state.isPaginationLoading)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: ColorPalette.white,
                              )),
                            ),
                          ),
                        ...groupedMessages.expand((group) => [
                              SliverMainAxisGroup(slivers: [
                                SliverPersistentHeader(
                                  pinned: true,
                                  delegate:
                                      _DateHeaderDelegate(date: group.key),
                                ),
                                SliverList.builder(
                                  itemCount: group.value.length,
                                  itemBuilder: (context, index) {
                                    final message = group.value[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: ChatItem(message: message),
                                    );
                                  },
                                ),
                              ])
                            ]),
                      ]);
                },
              ),
              JumpToPresentView(
                scrollToBottom: _scrollToBottom,
              ),
            ],
          ),
        ),
        const _TextInputField(),
        if (isMobile)
          SizedBox(
            height: 16,
          ),
      ],
    );
  }
}

class ChatItem extends StatefulWidget {
  const ChatItem({
    super.key,
    required this.message,
    this.isLoading = false,
  });

  final Message message;
  final bool isLoading;

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDelivered = widget.message.isDelivered;
    final userNameIsNull = widget.message.senderInfo?.userName == null;
    final isDeleted = widget.message.isDeleted;
    final hasImg = widget.message.senderInfo?.imageUrl != null;
    if (isDeleted) {
      _handleHover(false);
    }

    return MouseRegion(
      onEnter: (_) => isDeleted ? null : _handleHover(true),
      onExit: (_) => isDeleted ? null : _handleHover(false),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscordIconButton.filled(
                tooltip: 'Open Profile',
                onPressed: () {
                  // Open profile dialog
                  showDialog(
                    context: context,
                    builder: (context) => ProfileCard(
                      user: DiscordUser(
                        id: widget.message.senderInfo!.id,
                        userInfo: widget.message.senderInfo!,
                        userInfoId: widget.message.senderInfo!.id!,
                        status: ActivityStatus.invisible,
                      ),
                    ),
                  );
                },
                icon: hasImg
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(
                          widget.message.senderInfo!.imageUrl!,
                        ),
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
                          widget.message.senderInfo?.userName ?? '',
                          style: locator<FontStyles>().usernameStyle,
                        ),
                        if (!userNameIsNull)
                          SizedBox(
                            width: 8,
                          ),
                        if (widget.isLoading)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: ColorPalette.primaryVariantOne,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '           ',
                              style: locator<FontStyles>().chatDateStyle,
                            ),
                          )
                        else
                          Text(
                            DateFormat('h:mm a')
                                .format(widget.message.timeStamp.toLocal()),
                            style: locator<FontStyles>().chatDateStyle,
                          ),
                      ],
                    ),
                    if (widget.isLoading)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorPalette.primaryVariantOne,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('                                  ' * 4,
                            style: locator<FontStyles>().chatStyle),
                      )
                    else
                      Text(
                        isDeleted
                            ? 'This message was deleted'
                            : widget.message.content,
                        style: isDeleted
                            ? locator<FontStyles>().chatDeletedStyle
                            : isDelivered
                                ? locator<FontStyles>().chatStyle
                                : locator<FontStyles>().chatUndelivered,
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (!widget.isLoading && !isDeleted)
            Positioned(
              right: 0,
              top: 0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DiscordIconButton(
                      tooltip: 'Delete Message',
                      onPressed: () {
                        locator<ChatCubit>().deleteMessage(widget.message);
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        size: 16,
                        color: ColorPalette.unselectedChannelIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TextInputField extends StatefulWidget {
  const _TextInputField();

  @override
  State<_TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<_TextInputField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelCubit, ChannelState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: DiscordTextField(
            autofocus: true,
            controller: controller,
            textInputAction: TextInputAction.send,
            onSubmitted: (value) {
              locator<ChatCubit>().sendMessage(
                value,
                state.selectedChannel.id!,
                locator<UserCubit>().state.user,
              );
              controller.clear();
            },
            maxLines: 6,
            minLines: 1,
            textAlignVertical: TextAlignVertical.center,
            prefixIcon: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.addFile,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                Assets.addGif,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            hintText: 'Message #${state.selectedChannel.name}',
          ),
        );
      },
    );
  }
}

class _DateHeaderDelegate extends SliverPersistentHeaderDelegate {
  _DateHeaderDelegate({
    required this.date,
  });

  final String date;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ColorPalette.chatDateHeader,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            date,
            style: locator<FontStyles>().chatDateStyle,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class LoadingChatList extends StatelessWidget {
  const LoadingChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverList.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            final emptyMessage = Message(
              senderInfoId: -1,
              content: 'I love this app',
              contentType: '',
              timeStamp: DateTime.now(),
              channelId: -1,
              isDelivered: true,
              isDeleted: false,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ChatItem(
                message: emptyMessage,
                isLoading: true,
              ),
            );
          },
        ),
      ],
    );
  }
}

class JumpToPresentView extends StatelessWidget {
  const JumpToPresentView({super.key, required this.scrollToBottom});

  final void Function() scrollToBottom;

  @override
  Widget build(BuildContext context) {
    //TODO: I do not like the fidelity of this entire section

    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) =>
          previous.viewingOlderMessages != current.viewingOlderMessages,
      builder: (context, state) {
        final viewingOlderMessages = state.viewingOlderMessages;

        return AnimatedPositioned(
          curve: Curves.easeInOut,
          duration: Durations.short3,
          bottom: viewingOlderMessages ? 8 : 0,
          top: 0,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              duration: Durations.short3,
              child: viewingOlderMessages
                  ? DecoratedBox(
                      key: ValueKey('jump-to-present'),
                      decoration: BoxDecoration(
                        color: ColorPalette.primaryVariantOne,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'You\'re viewing older messages',
                              style: locator<FontStyles>().jumpToPresentStyle,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                              ),
                              onPressed: () => scrollToBottom.call(),
                              child: Text(
                                'Jump To Present',
                                style: locator<FontStyles>().jumpToPresentStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(key: ValueKey('empty')),
            ),
          ),
        );
      },
    );
  }
}
