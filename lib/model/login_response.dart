// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);

// import 'dart:convert';

// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   int? statusCode;
//   String? message;
//   Data? data;

//   LoginModel({
//     this.statusCode,
//     this.message,
//     this.data,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//     statusCode: json["statusCode"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }

// class Data {
//   Bank? bank;
//   bool? kyc;
//   bool? kycDocumentReUpload;
//   bool? kycNameMismatch;
//   String? kycCurrentStatus;
//   String? afterKyc;
//   bool? notifications;
//   bool? transactionNotifications;
//   String? applicantId;
//   String? sdkToken;
//   bool? firstTransaction;
//   List<KycStatus>? kycStatus;
//   String? city;
//   String? countryResidence;
//   DateTime? dob;
//   String? gender;
//   String? line1;
//   dynamic line2;
//   String? nationality;
//   String? postalCode;
//   String? state;
//   String? nymAccountNumber;
//   String? cityOfBirth;
//   String? placeOfBirth;
//   String? currency;
//   String? employmentType;
//   int? expectedMonthlyBalance;
//   UserProfileData? userProfileData;
//   String? accessToken;
//   String? refreshToken;
//   bool? isChildAdded;
//   String? userType;

//   Data({
//     this.bank,
//     this.kyc,
//     this.kycDocumentReUpload,
//     this.kycNameMismatch,
//     this.kycCurrentStatus,
//     this.afterKyc,
//     this.notifications,
//     this.transactionNotifications,
//     this.applicantId,
//     this.sdkToken,
//     this.firstTransaction,
//     this.kycStatus,
//     this.city,
//     this.countryResidence,
//     this.dob,
//     this.gender,
//     this.line1,
//     this.line2,
//     this.nationality,
//     this.postalCode,
//     this.state,
//     this.nymAccountNumber,
//     this.cityOfBirth,
//     this.placeOfBirth,
//     this.currency,
//     this.employmentType,
//     this.expectedMonthlyBalance,
//     this.userProfileData,
//     this.accessToken,
//     this.refreshToken,
//     this.isChildAdded,
//     this.userType,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
//     kyc: json["kyc"],
//     kycDocumentReUpload: json["kycDocumentReUpload"],
//     kycNameMismatch: json["kycNameMismatch"],
//     kycCurrentStatus: json["kycCurrentStatus"],
//     afterKyc: json["afterKyc"],
//     notifications: json["notifications"],
//     transactionNotifications: json["transactionNotifications"],
//     applicantId: json["applicantId"],
//     sdkToken: json["sdkToken"],
//     firstTransaction: json["firstTransaction"],
//     kycStatus: json["kycStatus"] == null ? [] : List<KycStatus>.from(json["kycStatus"]!.map((x) => KycStatus.fromJson(x))),
//     city: json["city"],
//     countryResidence: json["countryResidence"],
//     dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//     gender: json["gender"],
//     line1: json["line1"],
//     line2: json["line2"],
//     nationality: json["nationality"],
//     postalCode: json["postalCode"],
//     state: json["state"],
//     nymAccountNumber: json["nymAccountNumber"],
//     cityOfBirth: json["cityOfBirth"],
//     placeOfBirth: json["placeOfBirth"],
//     currency: json["currency"],
//     employmentType: json["employmentType"],
//     expectedMonthlyBalance: json["expectedMonthlyBalance"],
//     userProfileData: json["userProfileData"] == null ? null : UserProfileData.fromJson(json["userProfileData"]),
//     accessToken: json["accessToken"],
//     refreshToken: json["refreshToken"],
//     isChildAdded: json["isChildAdded"],
//     userType: json["userType"],
//   );

//   Map<String, dynamic> toJson() => {
//     "bank": bank?.toJson(),
//     "kyc": kyc,
//     "kycDocumentReUpload": kycDocumentReUpload,
//     "kycNameMismatch": kycNameMismatch,
//     "kycCurrentStatus": kycCurrentStatus,
//     "afterKyc": afterKyc,
//     "notifications": notifications,
//     "transactionNotifications": transactionNotifications,
//     "applicantId": applicantId,
//     "sdkToken": sdkToken,
//     "firstTransaction": firstTransaction,
//     "kycStatus": kycStatus == null ? [] : List<dynamic>.from(kycStatus!.map((x) => x.toJson())),
//     "city": city,
//     "countryResidence": countryResidence,
//     "dob": dob?.toIso8601String(),
//     "gender": gender,
//     "line1": line1,
//     "line2": line2,
//     "nationality": nationality,
//     "postalCode": postalCode,
//     "state": state,
//     "nymAccountNumber": nymAccountNumber,
//     "cityOfBirth": cityOfBirth,
//     "placeOfBirth": placeOfBirth,
//     "currency": currency,
//     "employmentType": employmentType,
//     "expectedMonthlyBalance": expectedMonthlyBalance,
//     "userProfileData": userProfileData?.toJson(),
//     "accessToken": accessToken,
//     "refreshToken": refreshToken,
//     "isChildAdded": isChildAdded,
//     "userType": userType,
//   };
// }

// class Bank {
//   bool? completed;

//   Bank({
//     this.completed,
//   });

//   factory Bank.fromJson(Map<String, dynamic> json) => Bank(
//     completed: json["completed"],
//   );

//   Map<String, dynamic> toJson() => {
//     "completed": completed,
//   };
// }

// class KycStatus {
//   String? id;
//   String? value;
//   int? time;

//   KycStatus({
//     this.id,
//     this.value,
//     this.time,
//   });

//   factory KycStatus.fromJson(Map<String, dynamic> json) => KycStatus(
//     id: json["_id"],
//     value: json["value"],
//     time: json["time"],
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "value": value,
//     "time": time,
//   };
// }

// class UserProfileData {
//   String? id;
//   String? profilePicture;
//   String? country;
//   String? mobileNo;
//   String? countryCode;
//   String? fullMobileNo;
//   String? email;
//   String? firstName;
//   String? lastName;
//   int? created;
//   bool? isBiometricEnabled;
//   bool? isMobileNoVerified;
//   bool? isEmailVerified;
//   String? status;
//   DateTime? createdAt;

//   UserProfileData({
//     this.id,
//     this.profilePicture,
//     this.country,
//     this.mobileNo,
//     this.countryCode,
//     this.fullMobileNo,
//     this.email,
//     this.firstName,
//     this.lastName,
//     this.created,
//     this.isBiometricEnabled,
//     this.isMobileNoVerified,
//     this.isEmailVerified,
//     this.status,
//     this.createdAt,
//   });

//   factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
//     id: json["_id"],
//     profilePicture: json["profilePicture"],
//     country: json["country"],
//     mobileNo: json["mobileNo"],
//     countryCode: json["countryCode"],
//     fullMobileNo: json["fullMobileNo"],
//     email: json["email"],
//     firstName: json["firstName"],
//     lastName: json["lastName"],
//     created: json["created"],
//     isBiometricEnabled: json["isBiometricEnabled"],
//     isMobileNoVerified: json["isMobileNoVerified"],
//     isEmailVerified: json["isEmailVerified"],
//     status: json["status"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "profilePicture": profilePicture,
//     "country": country,
//     "mobileNo": mobileNo,
//     "countryCode": countryCode,
//     "fullMobileNo": fullMobileNo,
//     "email": email,
//     "firstName": firstName,
//     "lastName": lastName,
//     "created": created,
//     "isBiometricEnabled": isBiometricEnabled,
//     "isMobileNoVerified": isMobileNoVerified,
//     "isEmailVerified": isEmailVerified,
//     "status": status,
//     "createdAt": createdAt?.toIso8601String(),
//   };
// }
