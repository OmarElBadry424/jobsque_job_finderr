
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../Local/cache helper.dart';
import '../../Local/dio helper.dart';
import '../../Local/endpoints.dart';
import '../../Local/enum.dart';
import '../../saved_job/model/favourite_model.dart';
import '../model/applied_job_model.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit() : super(AppliedJobInitial());

  static AppliedJobCubit get(context)=>BlocProvider.of(context);

  int activeIndex = 0;
changeIndex(index){
  activeIndex=index;
  emit(ChangeIndex());
}





  List<JobData> appliedJobsData = [];

  void getAppliedJobs({required String jobId}) {
    emit(GetAppliedJobsLoading());
    DioHelper.getData(url: '$allJobsURL/$jobId')
        .then((value) {

      appliedJobsData.add(JobData.fromJson(value.data['data']));

      if (appliedJobsData.isEmpty) {
        emit(AppliedJobEmpty());
      } else {
        emit(GetAppliedJobsSuccessfully());
     }

    })
        .catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsError());
    });
  }

  void getAppliedJobsId(){

    emit(GetAppliedJobsIDLoading());
    DioHelper.getData(url: '$applyJobURL/${CashHelper.getString(key: MySharedKeys.userId)}')
        .then((value) {
      if(value.data['data'].isEmpty){
        emit(AppliedJobEmpty());
      }
      else{
        for (var job in value.data['data']) {
          String id= AppliedJobData.fromJson(job).jobsId.toString();
          getAppliedJobs(jobId: id);
        }
        emit(GetAppliedJobsIDSuccessfully());

      }





    })
        .catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsIDError());
    });

  }



}
