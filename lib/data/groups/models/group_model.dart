class GroupModel {
  String? id;
  String? name;
  String? groupAdmin;
  int? hashNumber;

  GroupModel({this.id, this.name, this.groupAdmin, this.hashNumber});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    groupAdmin = json['groupAdmin'];
    hashNumber = json['hashNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['groupAdmin'] = this.groupAdmin;
    data['hashNumber'] = this.hashNumber;
    return data;
  }
}