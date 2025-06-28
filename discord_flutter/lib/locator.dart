import 'package:discord_client/discord_client.dart';
import 'package:discord_flutter/application/auth/auth_cubit.dart';
import 'package:discord_flutter/application/channel/channel_cubit.dart';
import 'package:discord_flutter/application/chat/chat_cubit.dart';
import 'package:discord_flutter/application/live_stream/live_stream_cubit.dart';
import 'package:discord_flutter/application/member/member_cubit.dart';
import 'package:discord_flutter/application/right_side_bar/right_side_bar_cubit.dart';
import 'package:discord_flutter/application/search/search_cubit.dart';
import 'package:discord_flutter/application/server/server_cubit.dart';
import 'package:discord_flutter/application/user/user_cubit.dart';
import 'package:discord_flutter/configs.dart';
import 'package:discord_flutter/infrastructure/channel/channel_repository.dart';
import 'package:discord_flutter/infrastructure/chat/chat_repository.dart';
import 'package:discord_flutter/infrastructure/live_stream/live_stream_repository.dart';
import 'package:discord_flutter/infrastructure/member/member_repository.dart';
import 'package:discord_flutter/infrastructure/search/search_repository.dart';
import 'package:discord_flutter/infrastructure/server/server_repository.dart';
import 'package:discord_flutter/infrastructure/user/user_repository.dart';
import 'package:discord_flutter/presentation/core/font_styles.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

final locator = GetIt.instance;

void initLocator() {
  //services
  locator.registerLazySingleton<Client>(() => Client(
        locator<Configs>().host,
        authenticationKeyManager: FlutterAuthenticationKeyManager(),
      ));

  locator.registerLazySingleton<SessionManager>(
    () => SessionManager(
      caller: locator<Client>().modules.auth,
      storage: SharedPreferenceStorage(),
    ),
  );

  //repositories
  locator.registerLazySingleton<ServerRepository>(
    () => ServerRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<ChannelRepository>(
    () => ChannelRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<ChatRepository>(
    () => ChatRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<LiveStreamRepository>(
    () => LiveStreamRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<SearchRepository>(
    () => SearchRepository(
      client: locator<Client>(),
    ),
  );
  locator.registerLazySingleton<MemberRepository>(
    () => MemberRepository(
      client: locator<Client>(),
    ),
  );

  //blocs
  locator.registerLazySingleton<ChatCubit>(
    () => ChatCubit(
      repo: locator<ChatRepository>(),
    ),
  );
  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      sessionManager: locator<SessionManager>(),
    ),
  );
  locator.registerLazySingleton<ServerCubit>(
    () => ServerCubit(
      repo: locator<ServerRepository>(),
    ),
  );
  locator.registerLazySingleton<ChannelCubit>(
    () => ChannelCubit(
      repo: locator<ChannelRepository>(),
    ),
  );
  locator.registerLazySingleton<UserCubit>(
    () => UserCubit(
      repo: locator<UserRepository>(),
    ),
  );
  locator.registerLazySingleton<LiveStreamCubit>(
    () => LiveStreamCubit(
      repo: locator<LiveStreamRepository>(),
    ),
  );
  locator.registerLazySingleton<RightSideBarCubit>(
    () => RightSideBarCubit(),
  );
  locator.registerLazySingleton<MemberCubit>(
    () => MemberCubit(
      repo: locator<MemberRepository>(),
    ),
  );
  locator.registerLazySingleton<SearchCubit>(
    () => SearchCubit(
      searchRepository: locator<SearchRepository>(),
    ),
  );

  //theming
  locator.registerLazySingleton<FontStyles>(
    () => FontStyles(),
  );

  //configs
  locator.registerLazySingleton<Configs>(
    () => Configs(),
  );
}
