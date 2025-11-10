import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/locator.dart';
import 'package:discord_flutter/presentation/core/assets.dart';
import 'package:discord_flutter/presentation/core/components/discord_text_field.dart';
import 'package:discord_flutter/presentation/home/right_side_bar/search/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchSideBar extends StatefulWidget {
  final int channelId;

  const SearchSideBar({
    super.key,
    required this.channelId,
  });

  @override
  State<SearchSideBar> createState() => _SearchSideBarState();
}

class _SearchSideBarState extends State<SearchSideBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscordTextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                isDense: true,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 36,
                ),
                prefixIcon: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    Assets.search,
                    height: 16,
                    width: 16,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                hintText:
                    'Search in ${locator<ChannelCubit>().state.selectedChannel.name}',
                onChanged: (value) =>
                    locator<SearchCubit>().search(value, widget.channelId),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.searchResults != current.searchResults,
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      )),
                      child: child,
                    ),
                  );
                },
                child: KeyedSubtree(
                  key: ValueKey(state.isLoading ? 'loading' : 'results'),
                  child: SearchList(
                    state: state,
                    channelId: widget.channelId,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SearchList extends StatelessWidget {
  final SearchState state;
  final int channelId;

  const SearchList({
    super.key,
    required this.state,
    required this.channelId,
  });

  @override
  Widget build(BuildContext context) {
    final emptyMessage = Message(
      id: 1,
      content: 'Loading...',
      senderInfoId: 1,
      contentType: 'text',
      timeStamp: DateTime.now(),
      channelId: channelId,
      isDelivered: true,
      isDeleted: false,
    );

    return ListView.builder(
      itemCount: state.isLoading ? 5 : state.searchResults.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: SearchResultItem(
          message: state.isLoading ? emptyMessage : state.searchResults[index],
          isLoading: state.isLoading,
          query: state.query,
        ),
      ),
    );
  }
}
