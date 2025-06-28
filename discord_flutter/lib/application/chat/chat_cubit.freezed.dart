// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {
  bool get isDrawerOpen;
  bool get isLoading;
  Map<String, List<Message>> get messages;
  bool get endOfMessages;
  bool get isPaginationLoading;
  bool get hasFetchedPagination;
  bool get viewingOlderMessages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<ChatState> get copyWith =>
      _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatState &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            (identical(other.endOfMessages, endOfMessages) ||
                other.endOfMessages == endOfMessages) &&
            (identical(other.isPaginationLoading, isPaginationLoading) ||
                other.isPaginationLoading == isPaginationLoading) &&
            (identical(other.hasFetchedPagination, hasFetchedPagination) ||
                other.hasFetchedPagination == hasFetchedPagination) &&
            (identical(other.viewingOlderMessages, viewingOlderMessages) ||
                other.viewingOlderMessages == viewingOlderMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDrawerOpen,
      isLoading,
      const DeepCollectionEquality().hash(messages),
      endOfMessages,
      isPaginationLoading,
      hasFetchedPagination,
      viewingOlderMessages);

  @override
  String toString() {
    return 'ChatState(isDrawerOpen: $isDrawerOpen, isLoading: $isLoading, messages: $messages, endOfMessages: $endOfMessages, isPaginationLoading: $isPaginationLoading, hasFetchedPagination: $hasFetchedPagination, viewingOlderMessages: $viewingOlderMessages)';
  }
}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) =
      _$ChatStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isDrawerOpen,
      bool isLoading,
      Map<String, List<Message>> messages,
      bool endOfMessages,
      bool isPaginationLoading,
      bool hasFetchedPagination,
      bool viewingOlderMessages});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDrawerOpen = null,
    Object? isLoading = null,
    Object? messages = null,
    Object? endOfMessages = null,
    Object? isPaginationLoading = null,
    Object? hasFetchedPagination = null,
    Object? viewingOlderMessages = null,
  }) {
    return _then(_self.copyWith(
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Message>>,
      endOfMessages: null == endOfMessages
          ? _self.endOfMessages
          : endOfMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaginationLoading: null == isPaginationLoading
          ? _self.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasFetchedPagination: null == hasFetchedPagination
          ? _self.hasFetchedPagination
          : hasFetchedPagination // ignore: cast_nullable_to_non_nullable
              as bool,
      viewingOlderMessages: null == viewingOlderMessages
          ? _self.viewingOlderMessages
          : viewingOlderMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ChatState implements ChatState {
  _ChatState(
      {required this.isDrawerOpen,
      required this.isLoading,
      required final Map<String, List<Message>> messages,
      required this.endOfMessages,
      required this.isPaginationLoading,
      required this.hasFetchedPagination,
      required this.viewingOlderMessages})
      : _messages = messages;

  @override
  final bool isDrawerOpen;
  @override
  final bool isLoading;
  final Map<String, List<Message>> _messages;
  @override
  Map<String, List<Message>> get messages {
    if (_messages is EqualUnmodifiableMapView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_messages);
  }

  @override
  final bool endOfMessages;
  @override
  final bool isPaginationLoading;
  @override
  final bool hasFetchedPagination;
  @override
  final bool viewingOlderMessages;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.endOfMessages, endOfMessages) ||
                other.endOfMessages == endOfMessages) &&
            (identical(other.isPaginationLoading, isPaginationLoading) ||
                other.isPaginationLoading == isPaginationLoading) &&
            (identical(other.hasFetchedPagination, hasFetchedPagination) ||
                other.hasFetchedPagination == hasFetchedPagination) &&
            (identical(other.viewingOlderMessages, viewingOlderMessages) ||
                other.viewingOlderMessages == viewingOlderMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDrawerOpen,
      isLoading,
      const DeepCollectionEquality().hash(_messages),
      endOfMessages,
      isPaginationLoading,
      hasFetchedPagination,
      viewingOlderMessages);

  @override
  String toString() {
    return 'ChatState(isDrawerOpen: $isDrawerOpen, isLoading: $isLoading, messages: $messages, endOfMessages: $endOfMessages, isPaginationLoading: $isPaginationLoading, hasFetchedPagination: $hasFetchedPagination, viewingOlderMessages: $viewingOlderMessages)';
  }
}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) _then) =
      __$ChatStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isDrawerOpen,
      bool isLoading,
      Map<String, List<Message>> messages,
      bool endOfMessages,
      bool isPaginationLoading,
      bool hasFetchedPagination,
      bool viewingOlderMessages});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDrawerOpen = null,
    Object? isLoading = null,
    Object? messages = null,
    Object? endOfMessages = null,
    Object? isPaginationLoading = null,
    Object? hasFetchedPagination = null,
    Object? viewingOlderMessages = null,
  }) {
    return _then(_ChatState(
      isDrawerOpen: null == isDrawerOpen
          ? _self.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Message>>,
      endOfMessages: null == endOfMessages
          ? _self.endOfMessages
          : endOfMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaginationLoading: null == isPaginationLoading
          ? _self.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasFetchedPagination: null == hasFetchedPagination
          ? _self.hasFetchedPagination
          : hasFetchedPagination // ignore: cast_nullable_to_non_nullable
              as bool,
      viewingOlderMessages: null == viewingOlderMessages
          ? _self.viewingOlderMessages
          : viewingOlderMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
