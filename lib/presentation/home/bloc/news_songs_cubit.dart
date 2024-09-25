import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsInitial());
}
