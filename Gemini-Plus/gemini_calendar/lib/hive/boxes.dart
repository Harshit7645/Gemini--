import 'package:gemini_calendar/hive/chat_history.dart';
import 'package:gemini_calendar/hive/settings.dart';
import 'package:gemini_calendar/hive/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ChatHistory> getChatHistory() => Hive.box<ChatHistory>('chat_history');

    static Box<UserModel>getUser() => Hive.box<UserModel>('user_box');

    static Box<Settings> getSettings() => Hive.box('settings');
}