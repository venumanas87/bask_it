import 'dart:ffi';

import 'package:bask_it/models/shop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Shop> getDataCollection(String code) {
    return _db.collection("shops").where("code",isEqualTo: code.toUpperCase()).get().then(
            (value) => value.docs.map((e) => Shop.fromFirestore(e.data())).first
    );
  }



/*  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }*/

}