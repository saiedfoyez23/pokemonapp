class Pokamondetails {
  String? id;
  String? number;
  Weight? weight;
  Weight? height;
  String? name;
  String? classification;
  String? image;
  List<String>? types;
  List<String>? resistant;
  Attacks? attacks;
  List<String>? weaknesses;
  double? fleeRate;
  int? maxCP;
  int? maxHP;

  Pokamondetails(
      {this.id,
      this.number,
      this.weight,
      this.height,
      this.name,
      this.classification,
      this.image,
      this.types,
      this.resistant,
      this.attacks,
      this.weaknesses,
      this.fleeRate,
      this.maxCP,
      this.maxHP});

  Pokamondetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
        json['height'] != null ? new Weight.fromJson(json['height']) : null;
    name = json['name'];
    classification = json['classification'];
    image = json['image'];
    types = json['types'].cast<String>();
    resistant = json['resistant'].cast<String>();
    attacks =
        json['attacks'] != null ? new Attacks.fromJson(json['attacks']) : null;
    weaknesses = json['weaknesses'].cast<String>();
    fleeRate = json['fleeRate'];
    maxCP = json['maxCP'];
    maxHP = json['maxHP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    data['name'] = this.name;
    data['classification'] = this.classification;
    data['image'] = this.image;
    data['types'] = this.types;
    data['resistant'] = this.resistant;
    if (this.attacks != null) {
      data['attacks'] = this.attacks!.toJson();
    }
    data['weaknesses'] = this.weaknesses;
    data['fleeRate'] = this.fleeRate;
    data['maxCP'] = this.maxCP;
    data['maxHP'] = this.maxHP;
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

class Attacks {
  List<Fast>? fast;
  List<Special>? special;

  Attacks({this.fast, this.special});

  Attacks.fromJson(Map<String, dynamic> json) {
    if (json['fast'] != null) {
      fast = <Fast>[];
      json['fast'].forEach((v) {
        fast!.add(new Fast.fromJson(v));
      });
    }
    if (json['special'] != null) {
      special = <Special>[];
      json['special'].forEach((v) {
        special!.add(new Special.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fast != null) {
      data['fast'] = this.fast!.map((v) => v.toJson()).toList();
    }
    if (this.special != null) {
      data['special'] = this.special!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fast {
  String? name;
  String? type;
  int? damage;

  Fast({this.name, this.type, this.damage});

  Fast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    damage = json['damage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['damage'] = this.damage;
    return data;
  }
}


class Special{
  String? name;
  String? type;
  int? damage;

  Special({this.name, this.type, this.damage});

  Special.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    damage = json['damage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['damage'] = this.damage;
    return data;
  }
}