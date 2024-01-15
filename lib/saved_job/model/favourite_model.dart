class SaveModel {
  bool? status;
  List<SaveData>? data;

  SaveModel({this.status, this.data});

  SaveModel.fromJson(Map<String, dynamic> datas) {
    status = datas['status'];
    if (datas['data'] != null) {
      data = <SaveData>[];
      datas['data'].forEach((v) {
        data!.add(new SaveData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaveData {
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  JobData? jobs;

  SaveData(
      {this.id,
        this.userId,
        this.like,
        this.jobId,
        this.image,
        this.name,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.jobs});

  SaveData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    userId = data['user_id'];
    like = data['like'];
    jobId = data['job_id'];
    image = data['image'];
    name = data['name'];
    location = data['location'];
    createdAt = data['created_at'];
    updatedAt = data['updated_at'];
    jobs = data['jobs'] != null ? new JobData.fromJson(data['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['like'] = like;
    data['job_id'] = jobId;
    data['image'] = image;
    data['name'] = name;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    return data;
  }
}

class JobData {
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;

  JobData(
      {this.id,
        this.name,
        this.image,
        this.jobTimeType,
        this.jobType,
        this.jobLevel,
        this.jobDescription,
        this.jobSkill,
        this.compName,
        this.compEmail,
        this.compWebsite,
        this.aboutComp,
        this.location,
        this.salary,
        this.favorites,
        this.expired,
        this.createdAt,
        this.updatedAt});

  JobData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
    jobTimeType = data['job_time_type'];
    jobType = data['job_type'];
    jobLevel = data['job_level'];
    jobDescription = data['job_description'];
    jobSkill = data['job_skill'];
    compName = data['comp_name'];
    compEmail = data['comp_email'];
    compWebsite = data['comp_website'];
    aboutComp = data['about_comp'];
    location = data['location'];
    salary = data['salary'];
    favorites = data['favorites'];
    expired = data['expired'];
    createdAt = data['created_at'];
    updatedAt = data['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['job_time_type'] = jobTimeType;
    data['job_type'] = jobType;
    data['job_level'] = jobLevel;
    data['job_description'] = jobDescription;
    data['job_skill'] = jobSkill;
    data['comp_name'] = compName;
    data['comp_email'] = compEmail;
    data['comp_website'] = compWebsite;
    data['about_comp'] = aboutComp;
    data['location'] = location;
    data['salary'] = salary;
    data['favorites'] = favorites;
    data['expired'] = expired;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
