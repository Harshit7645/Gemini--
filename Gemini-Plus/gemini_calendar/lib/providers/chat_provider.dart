import 'package:flutter/material.dart';
import 'package:gemini_calendar/constants.dart';
import 'package:gemini_calendar/hive/chat_history.dart';
import 'package:gemini_calendar/hive/settings.dart';
import 'package:gemini_calendar/hive/user_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

class ChatProvider extends ChangeNotifier{
  static initHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter(Constants.geminiDB);

    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(ChatHistoryAdapter());
      await Hive.openBox<ChatHistory>(Constants.chatHistoryBox);
    }

    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(UserModelAdapter());
      await Hive.openBox<UserModel>(Constants.userBox);
    }

    if(!Hive.isAdapterRegistered(2)){
      Hive.registerAdapter(SettingsAdapter());
      await Hive.openBox<Settings>(Constants.settingsBox);
    }
  }
}