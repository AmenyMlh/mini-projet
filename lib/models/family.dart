class Family{
  int id = -1;
String name;
Family(this.id,this.name);
// ignore: non_constant_identifier_names
Family.NameOnly(this.name);
Map<String, Object?> toMap() => {
    'name' : name
  };
  factory Family.fromMap(Map<String, dynamic> json) => 
  Family(json['id'],json['name']);
}
