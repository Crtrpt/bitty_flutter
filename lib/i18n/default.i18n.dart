import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static final _t = Translations.from("en_us", {
    "recent": {"en_us": "recent", "zh-cn": "最新"},
    "last": {"en_us": "last message", "zh-cn": "最新消息"},
    "connector": {"en_us": "connector", "zh-cn": "通讯录"},
    "me": {"en_us": "me", "zh-cn": "我"},
    "inputYourAccount": {"en_us": "account", "zh-cn": "输入你的账户"},
    "inputYourPassword": {"en_us": "password", "zh-cn": "密码"},
    "inputYourEmail": {"en_us": "email", "zh-cn": "输入你的电子邮箱"},
    "agreeLicense": {"en_us": "I agree to the license agreement", "zh-cn": "同意许可协议"},
    "loginBtn": {"en_us": "Login", "zh-cn": "登录"},
    "signupLink": {"en_us": "Signup", "zh-cn": "注册"},
    "signupBtn": {"en_us": "Signup", "zh-cn": "登录"},
    "findPasswordLink": {"en_us": "Find my password", "zh-cn": "找回密码"},
  });

  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(value) => localizePlural(value, this, _t);
}
