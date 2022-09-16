abstract class BittyEvent {}

class AppStartEvent extends BittyEvent {}

class LoginEvent extends BittyEvent {
  var paylaod;

  LoginEvent(this.paylaod);
}

class LogoutEvent extends BittyEvent {}

class InitEvent extends BittyEvent {}
