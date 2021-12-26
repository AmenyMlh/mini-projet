import 'package:intl/intl.dart';

class Loans{
  int idMember;
  int idComponent;
  DateTime? DateEmp;
  DateTime? DateReturn;
  int returned = 0;
  Loans(this.idMember,this.idComponent,this.DateEmp,this.DateReturn,this.returned);
  Loans.withoutId(this.idMember,this.idComponent,this.DateEmp,this.DateReturn);

 

  Map<String, Object?> toMapWithoutId() => {
    'idMember' : idMember,
    'idComponent' : idComponent,
    'DateEmp' : DateEmp.toString(),
    'DateReturn' : DateReturn.toString(),
    'returned':returned
  };


  factory Loans.fromMap(Map<String, dynamic> json) => 
  Loans(json['idMember'],json['idComponent'],DateFormat('yyyy-MM-dd').parse(json['dateEmp']),DateFormat('yyyy-MM-dd').parse(json['dateReturn']),json['returned']);
}