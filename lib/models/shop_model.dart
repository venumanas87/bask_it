class Shop{
  String name;
  String code;
  String? password;

  Shop({required this.name,required this.code,this.password});

  Map<String,dynamic> createMap(){
    return {
      'name': name,
      'code': code,
      'password':password
    };
  }




  Shop.fromFirestore(Map<String,dynamic> firestoreMap):
        name = firestoreMap['name'],
        code = firestoreMap['code'],
        password = firestoreMap['password'];
}