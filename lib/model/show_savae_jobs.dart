class ShowSavedJobs {
  bool? status;
  List<showSavedData>? data;

  ShowSavedJobs({this.status, this.data});

  ShowSavedJobs.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <showSavedData>[];
      json['data'].forEach((v) {
        data!.add(new showSavedData.fromJson(v));
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

class showSavedData {
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  Jobs? jobs;

  showSavedData(
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

  showSavedData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ??0;
    like = json['like'] ??0;
    jobId = json['job_id'] ??0 ;
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    location = json['location'] ?? '';
    createdAt = json['created_at'] ?? '' ;
    updatedAt = json['updated_at'] ?? '';
    jobs = json['jobs'] != null ? new Jobs.fromJson(json['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['like'] = this.like;
    data['job_id'] = this.jobId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    return data;
  }
}

class Jobs {
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

  Jobs(
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

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name']  ;
    image = json['image'] ;
    jobTimeType = json['job_time_type'] ;
    jobType = json['job_type'] ;
    jobLevel = json['job_level'] ;
    jobDescription = json['job_description'] ;
    jobSkill = json['job_skill'] ;
    compName = json['comp_name'] ;
    compEmail = json['comp_email'] ;
    compWebsite = json['comp_website'] ;
    aboutComp = json['about_comp'] ;
    location = json['location'] ;
    salary = json['salary'] ;
    favorites = json['favorites'] ;
    expired = json['expired'] ;
    createdAt = json['created_at'] ;
    updatedAt = json['updated_at'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['job_time_type'] = this.jobTimeType;
    data['job_type'] = this.jobType;
    data['job_level'] = this.jobLevel;
    data['job_description'] = this.jobDescription;
    data['job_skill'] = this.jobSkill;
    data['comp_name'] = this.compName;
    data['comp_email'] = this.compEmail;
    data['comp_website'] = this.compWebsite;
    data['about_comp'] = this.aboutComp;
    data['location'] = this.location;
    data['salary'] = this.salary;
    data['favorites'] = this.favorites;
    data['expired'] = this.expired;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
