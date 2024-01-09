import 'package:hive/hive.dart';
part 'user.g.dart';


@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  Add_data(this.name,this.email,this.password);
}
