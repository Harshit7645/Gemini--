class Message{
  String messageID;
  String chatID;
  Role role;
  StringBuffer message;
  List<String>imageURLs;
  DateTime timeSent;

  Message({
    required this.messageID,
    required this.chatID,
    required this.role,
    required this.message,
    required this.imageURLs,
    required this.timeSent,
  });

  //toMap
  Map<String, dynamic> toMap(){
    return {
      'messageID': messageID,
      'chatID': chatID,
      'role': role,
      'message': message.toString(),
      'imageURLs': imageURLs,
      'timeSent': timeSent.toIso8601String(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map){
    return Message(
      messageID: map['messageID'],
      chatID: map['chatID'],
      role: Role.values[map['role']],
      message: StringBuffer(map['message']),
      imageURLs: List<String>.from(map['imageURLs']),
      timeSent: DateTime.parse(map['timeSent']),
      );
    }
  
  Message copyWith({
    String? messageID,
    String? chatID,
    Role? role,
    StringBuffer? message,
    List<String>? imageURLs,
    DateTime? timeSent,
  }) {
    return Message(
      messageID: messageID ?? this.messageID,
      chatID: chatID ?? this.chatID,
      role: role ?? this.role,
      message: message ?? this.message,
      imageURLs: imageURLs ?? this.imageURLs,
      timeSent: timeSent ?? this.timeSent,
    );
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other))
    return true;

    return other is Message && other.messageID == this.messageID;
  }

  @override
  int get hashCode {
    return messageID.hashCode;
  } 
} 

enum Role{
  user,
  assistant,
}