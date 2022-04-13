import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations.from("en_us", {
    "recent": {"en_us": "recent", "zh-cn": "最新"},
    "last": {"en_us": "last message", "zh-cn": "最新消息"},
    "connector": {"en_us": "connector", "zh-cn": "通讯录"},
    "me": {"en_us": "me", "zh-cn": "我"},
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
