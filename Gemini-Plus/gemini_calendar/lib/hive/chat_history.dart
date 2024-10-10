import 'package:hive/hive.dart';

part 'chat_history.g.dart';

@HiveType(typeId: 0)
class ChatHistory{

  @HiveField(0)
  final String chatID;

  @HiveField(1)
  final String prompt;

  @HiveField(2)
  final String response;

  @HiveField(3)
  final List<String>imageURLs;

  @HiveField(4)
  final DateTime timestamp;

  //constructor
  ChatHistory({    
    required this.chatID,
    required this.prompt,
    required this.response,
    required this.imageURLs,
    required this.timestamp,
  });
}