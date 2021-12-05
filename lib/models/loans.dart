class Loans{
  int id=-1;
  String nameMember;
  String nameComponent;
  DateTime DateEmp;
  DateTime DateReturn;
  Loans(this.id,this.nameMember,this.nameComponent,this.DateEmp,this.DateReturn);
  Loans.withoutId(this.nameMember,this.nameComponent,this.DateEmp,this.DateReturn);
  Map<String, Object?> toMap() => {
    'id':id,
    'nameMember' : nameMember,
    'nameComponent' : nameComponent,
    'DateEmp' : DateEmp,
    'DateReturn' : DateReturn
  };
  factory Loans.fromMap(Map<String, dynamic> json) => 
  Loans(json['id'],json['nameMember'],json['nameComponent'],json['DateEmp'],json['DateReturn']);
}