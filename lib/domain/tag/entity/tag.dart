import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:feel_free_bizmail/domain/user/entity/user.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String? id,
    required User user,
    required String content,
    required DateTime? createdAt,
  }) = _Tag;
}
