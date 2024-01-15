import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Local/cache helper.dart';
import '../../Local/dio helper.dart';
import '../../Local/endpoints.dart';
import '../../Local/enum.dart';
import '../../saved_job/model/favourite_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<JobData> recentJobsData = [];

  void getAllRecentJobs() {
    emit(RecentJobsLoading());
    DioHelper.getData(url: allJobsURL)
        .then((value) {
      for (var job in value.data['data']) {
        recentJobsData.add(JobData.fromJson(job));
      }

      emit(RecentJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(RecentJobsError());
    });
  }

  List<JobData> suggestJobsData = [];

  void getAllSuggestJobs() {
    emit(SuggestJobsSuccessfully());
    DioHelper.getData(url: suggestJobsURL)
        .then((value) {
      suggestJobsData.add(JobData.fromJson(value.data['data']));


      emit(SuggestJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(SuggestJobsError());
    });
  }

  List<SaveData> savedItems=[];
  void getFavouriteJobs() {
    savedItems=[];
    emit(SavedJobsLoading());
    DioHelper.getData(url: SvedJobs)
        .then((value) {
      for (var job in value.data['data']) {
        savedItems.add(SaveData.fromJson(job));
        print(job);
      }


      emit(SavedJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(SavedJobsError());
    });
  }


  bool checkFavourite(var id) {
    for (var job in savedItems) {
      if (job.jobId == id) {
        return true;
      }
    }
    return false;
  }



  void addFavourite(JobData job){
      emit(AddSavedJobsLoading());
      DioHelper.PostData(url: SvedJobs, query: {
        'user_id':CashHelper.getString(key: MySharedKeys.userId),
        'job_id':job.id
      })
          .then((value) {
            getFavouriteJobs();


        print(value.data);
        emit(AddSavedJobsSuccessfully());
      })
          .catchError((error) {
        print(error.toString());
        emit(AddSavedJobsError());
      });
    }


  RemoveSaved(String id) {
    emit(RemoveSavedLoadingState());
    return DioHelper.deleteData(url: '$SvedJobs/$id').then((value) {
      getFavouriteJobs();
      emit(RemoveSavedSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      print(RemoveSavedErrorState());
    });
  }

  handleFavourite(JobData job) {
    if (checkFavourite(job.id!)) {

      RemoveSaved(SavedId(job.id!) );

    } else {
      addFavourite( job);
    }
  }

  SavedId(int id){
   for (var job in savedItems) {
     if (job.jobId == id) {
       print(job.id.toString());
       print('$SvedJobs/${job.id.toString()}');
       return job.id.toString();
     }
   }
 }

 @override
  Future<void> close() {
    return super.close();
  }



}
