import 'package:UI_House/models/models.dart';
import 'package:UI_House/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  HomeService._private();
  static final instance = HomeService._private();
  DocumentSnapshot last;
  int limit = 2;
  bool moreAvail = true;

  Future<Object> fetch(
      {bool reset, Type type, CollectionReference collectionReference}) async {
    if (reset) last = null;
    List<DocumentSnapshot> data;

    if (last != null) {
      data = await _fetchMorePhotos(collectionReference);
    } else {
      data = await _fetchPhotos(collectionReference);
    }
    if (data != null) {
      switch (type) {
        case Type.loadPhotos:
          return PhotoModel.fromDocumentSnapshot(data);
       
      }
    }

    return null;
  }

  Future<List<DocumentSnapshot>> _fetchPhotos(
      CollectionReference collection) async {
    final Query query = collection.orderBy('number').limit(limit);
    final QuerySnapshot snapshot = await query.get();
    final List<DocumentSnapshot> phts = snapshot.docs;
    last = snapshot.docs[phts.length - 1];
    // print(l.fromJson(krls));
    // return Kural.fromJson(krls);
    return phts;
  }

  Future<List<DocumentSnapshot>> _fetchMorePhotos(
      CollectionReference collection) async {
    print('fetch more kural func');

    final Query query = collection
        .orderBy('number')
        .startAfter([last.data()['number']]).limit(limit);

    if (moreAvail) {
      final QuerySnapshot snapshot = await query.get();
      // krls.addAll(snapshot.docs);
      if (snapshot.docs.length >= limit) {
        last = snapshot.docs[snapshot.docs.length - 1];
      } else {
        moreAvail = false;
      }
      return snapshot.docs;
    }
    print('nulllll');
    return null;
  }
}