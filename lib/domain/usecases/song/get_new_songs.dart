

import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usercase.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';


import '../../../service_locator.dart';

class GetNewSongsUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async{

    return await sl<SongRepositoryImpl>().getNewSongs();
  }


}
