import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 208,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            // // Line 1: Loading state with proper alignment


            if (state is NewsSongsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // Line 2: Loaded state
            if (state is NewsSongLoaded) {
              return _songs(state.songs);
            }

            // Line 3: Fallback for unknown or other states
            return const Center(child: Text('No songs available'));
          },
        ),
      ),
    );
  }

  // Line 4: Modified _songs method with ListView.separated
  Widget _songs(List<SongEntity> songs){
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
         return SizedBox(
           width: 160,
           child: Column(
             children: [
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(image: NetworkImage(
                   AppURLs.fireStorage + songs[index].artist + ' _ '+ songs[index].title + '.jpg' + AppURLs.mediaAlt
                 ))
               ),
             ),
           )
             ],
           ),
         );
        },
        separatorBuilder: (context, index) => SizedBox(width: 14,),
        itemCount: songs.length
    );
  }
}
