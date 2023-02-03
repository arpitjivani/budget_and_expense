
import 'package:spendee_budget_and_expense/Screens/Drawer_Screens/calendar_page.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Screens/main_page.dart';
import 'package:spendee_budget_and_expense/Screens/Drawer_Screens/settings_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<CalendarPage>(() => CalendarPage());
    register<SettingsPage>(() => SettingsPage());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}
