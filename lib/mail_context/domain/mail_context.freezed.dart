// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MailContext {
  String? get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  List<Tag> get sourceTag => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailContextCopyWith<MailContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailContextCopyWith<$Res> {
  factory $MailContextCopyWith(
          MailContext value, $Res Function(MailContext) then) =
      _$MailContextCopyWithImpl<$Res, MailContext>;
  @useResult
  $Res call(
      {String? id,
      User user,
      String context,
      List<Tag> sourceTag,
      DateTime? createdAt});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MailContextCopyWithImpl<$Res, $Val extends MailContext>
    implements $MailContextCopyWith<$Res> {
  _$MailContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? context = null,
    Object? sourceTag = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTag: null == sourceTag
          ? _value.sourceTag
          : sourceTag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailContextImplCopyWith<$Res>
    implements $MailContextCopyWith<$Res> {
  factory _$$MailContextImplCopyWith(
          _$MailContextImpl value, $Res Function(_$MailContextImpl) then) =
      __$$MailContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      User user,
      String context,
      List<Tag> sourceTag,
      DateTime? createdAt});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$MailContextImplCopyWithImpl<$Res>
    extends _$MailContextCopyWithImpl<$Res, _$MailContextImpl>
    implements _$$MailContextImplCopyWith<$Res> {
  __$$MailContextImplCopyWithImpl(
      _$MailContextImpl _value, $Res Function(_$MailContextImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? context = null,
    Object? sourceTag = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$MailContextImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTag: null == sourceTag
          ? _value._sourceTag
          : sourceTag // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$MailContextImpl implements _MailContext {
  const _$MailContextImpl(
      {required this.id,
      required this.user,
      required this.context,
      required final List<Tag> sourceTag,
      required this.createdAt})
      : _sourceTag = sourceTag;

  @override
  final String? id;
  @override
  final User user;
  @override
  final String context;
  final List<Tag> _sourceTag;
  @override
  List<Tag> get sourceTag {
    if (_sourceTag is EqualUnmodifiableListView) return _sourceTag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sourceTag);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MailContext(id: $id, user: $user, context: $context, sourceTag: $sourceTag, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailContextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.context, context) || other.context == context) &&
            const DeepCollectionEquality()
                .equals(other._sourceTag, _sourceTag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, user, context,
      const DeepCollectionEquality().hash(_sourceTag), createdAt);

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailContextImplCopyWith<_$MailContextImpl> get copyWith =>
      __$$MailContextImplCopyWithImpl<_$MailContextImpl>(this, _$identity);
}

abstract class _MailContext implements MailContext {
  const factory _MailContext(
      {required final String? id,
      required final User user,
      required final String context,
      required final List<Tag> sourceTag,
      required final DateTime? createdAt}) = _$MailContextImpl;

  @override
  String? get id;
  @override
  User get user;
  @override
  String get context;
  @override
  List<Tag> get sourceTag;
  @override
  DateTime? get createdAt;

  /// Create a copy of MailContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailContextImplCopyWith<_$MailContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
