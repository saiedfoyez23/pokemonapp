class Pokemon {
  String? id;
  Weight? weight;
  Weight? height;
  String? name;
  String? classification;
  String? image;

  Pokemon(
      {this.id,
      this.weight,
      this.height,
      this.name,
      this.classification,
      this.image});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Weight.fromJson(json['height']) : null;
    name = json['name'];
    classification = json['classification'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.weight != null) {
      data['weiht'] = this.weight!.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    data['name'] = this.name;
    data['classification'] = this.classification;
    data['image'] = this.image;
    return data;
  }
}

class Weight {
  String? minimum;
  String? maximum;

  Weight({this.minimum, this.maximum});

  Weight.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    maximum = json['maximum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    return data;
  }
}