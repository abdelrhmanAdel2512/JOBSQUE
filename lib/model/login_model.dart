class UserModel {
   User? user;
   String? token;
   bool? status;

   UserModel({
     this.user,
     this.token,
     this.status,
  });

   UserModel.fromJson(Map<String, dynamic> json) {
     if (json['user'] != null && json['user'] is Map<String, dynamic>) {
       user = User.fromJson(json['user']);
     }
     token = json['token'];
     status = json['status'];
   }
}

class User {
   int? id;
   String? name;
   String? email;
   String? createdAt;
   String? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }
}
