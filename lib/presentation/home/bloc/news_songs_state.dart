part of 'news_songs_cubit.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState{}

class NewsSongLoaded extends NewsSongsState{
  final List<SongEntity> songs;

  NewsSongLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongsState{}
