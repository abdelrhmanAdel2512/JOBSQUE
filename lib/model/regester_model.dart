class RegisterModel {
  bool? status;
  registerData? data;
  Profile? profile;
  String? token;

  RegisterModel({ this.status, this.data,  this.profile, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;

    // Ensure that 'data' is not null and is of type Map<String, dynamic>
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      data = registerData.fromJson(json['data']);
    }

    // The same check needs to be done for 'profile'
    if (json['profile'] != null && json['profile'] is Map<String, dynamic>) {
      profile = Profile.fromJson(json['profile']);
    }

    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class registerData {
  String? name;
  String? email;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;

  registerData(
      {this.name,
        this.email,
        this.otp,
        this.updatedAt,
        this.createdAt,
        this.id});

  registerData.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    otp = json['otp'] ?? 0;
    updatedAt = json['updated_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Profile {
  int? userId;
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  Profile(
      {this.userId,
        this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'] ?? 0;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}