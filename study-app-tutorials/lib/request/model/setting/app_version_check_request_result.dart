
class AppVersionCheckRequestResult {
  int? code;
  int? originCode;
  String? msg;
  String? originMsg;
  Data? data;

  AppVersionCheckRequestResult(
      {this.code, this.originCode, this.msg, this.originMsg, this.data});

  AppVersionCheckRequestResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    originCode = json['originCode'];
    msg = json['msg'];
    originMsg = json['originMsg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['originCode'] = this.originCode;
    data['msg'] = this.msg;
    data['originMsg'] = this.originMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? versionCode;
  String? description;
  int? fileId;
  String? fileUrl;
  String? versionName;
  int? fileSize;
  String? updateType;
  String? createTime;
  String? updateTime;
  String? createStaffId;
  String? updateStaffId;
  String? deleteState;

  Data({this.id,
    this.versionCode,
    this.description,
    this.fileId,
    this.fileUrl,
    this.versionName,
    this.fileSize,
    this.updateType,
    this.createTime,
    this.updateTime,
    this.createStaffId,
    this.updateStaffId,
    this.deleteState});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    versionCode = json['versionCode'];
    description = json['description'];
    fileId = json['fileId'];
    fileUrl = json['fileUrl'];
    versionName = json['versionName'];
    fileSize = json['fileSize'];
    updateType = json['updateType'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    createStaffId = json['createStaffId'];
    updateStaffId = json['updateStaffId'];
    deleteState = json['deleteState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['versionCode'] = this.versionCode;
    data['description'] = this.description;
    data['fileId'] = this.fileId;
    data['fileUrl'] = this.fileUrl;
    data['versionName'] = this.versionName;
    data['fileSize'] = this.fileSize;
    data['updateType'] = this.updateType;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['createStaffId'] = this.createStaffId;
    data['updateStaffId'] = this.updateStaffId;
    data['deleteState'] = this.deleteState;
    return data;
  }
}

