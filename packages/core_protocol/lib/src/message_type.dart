/// High-level packet kinds exchanged on the mesh.
enum MessageType {
  hello(0),
  chat(1),
  ack(2),
  presence(3);

  const MessageType(this.code);
  final int code;

  static MessageType fromCode(int code) {
    return MessageType.values.firstWhere(
      (t) => t.code == code,
      orElse: () => throw ArgumentError.value(code, 'code', 'Unknown message type'),
    );
  }
}
