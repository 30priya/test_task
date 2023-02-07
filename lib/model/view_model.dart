class ViewModel {
  int? id;
  String? name;
  String? fullName;
  Owner? owner;

  ViewModel({
    this.id,
    this.name,
    this.fullName,
    this.owner,
  });

  ViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;
    data['full_name'] = this.fullName;

    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }

    return data;
  }
}

class Owner {
  String? avatarUrl;

  Owner({
    this.avatarUrl,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;

    return data;
  }
}
