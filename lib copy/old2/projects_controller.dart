import 'package:rx_notifier/rx_notifier.dart';

class ProjetcsPageController {
  final _home = RxNotifier<bool>(false);
  final _isHovered1 = RxNotifier<bool>(false);
  final _isHovered2 = RxNotifier<bool>(false);

  bool get home => _home.value;
  set home(bool value) => _home.value = value;

  bool get isHovered1 => _isHovered1.value;
  set isHovered1(bool value) => _isHovered1.value = value;

  bool get isHovered2 => _isHovered2.value;
  set isHovered2(bool value) => _isHovered2.value = value;
  
  homeState() {
    _home.value = !_home.value;
  }

  isHovered1State() {
    _isHovered1.value = !_isHovered1.value;
  }

  isHovered2State() {
    _isHovered2.value = !_isHovered2.value;
  }
}
