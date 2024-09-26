import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:feel_free_bizmail/domain/user/entity/user.dart';
import 'package:feel_free_bizmail/domain/tag/entity/tag.dart';

part 'mail_context.freezed.dart';

@freezed
class MailContext with _$MailContext {
  const factory MailContext({
    required String? id,
    required User user,
    required String context,
    required List<Tag> sourceTag,
    required DateTime? createdAt,
  }) = _MailContext;
}
