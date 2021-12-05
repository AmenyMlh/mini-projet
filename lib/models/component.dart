class Component{
  int id=-1;
  String name;
  String family;
  int quantity;
  DateTime date;
  Component(this.id,this.name,this.family,this.quantity,this.date);
  Component.withoutId(this.name,this.family,this.quantity,this.date);
Map<String, Object?> toMap() => {
    'id':id,
    'name' : name,
    'family' : family,
    'quantity' : quantity,
    'date' : date
  };
  factory Component.fromMap(Map<String, dynamic> json) => 
  Component(json['id'],json['name'],json['family'],json['quantity'],json['date']);
}