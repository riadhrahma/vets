/////////////// User Connection State //////////////////
enum UserConnectionStatus { online, offline }

/////////////// Message Type //////////////////
enum ContentType {
  image,
  audio,
  document,
  video,
  text,
}

/////////////// Chat Request State //////////////////
enum ChatRequestStatus { pending, accepted, canceled }
