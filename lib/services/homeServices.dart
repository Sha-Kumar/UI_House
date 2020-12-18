import 'package:UI_House/models/models.dart';
import 'package:UI_House/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  HomeService._private();
  static final instance = HomeService._private();
  DocumentSnapshot last;
  int limit = 25;
  bool moreAvail = true;

  Future<int> saveOrUnSave(dynamic photoId) async {
    try {
      final Map<String, dynamic> querySnapshot =
          (await userCollection.doc(uidOfUser.toString()).get()).data();
      if (querySnapshot.isEmpty) {
        print(querySnapshot);
        return 2;
      }
      final UserModel usrval = UserModel.fromJson(querySnapshot);

      if (usrval.bookmarks.contains(photoId as dynamic)) {
        await userCollection.doc(uidOfUser.toString()).update({
          'bookmarks': FieldValue.arrayRemove([photoId as dynamic]),
        });
        return 1;
      }
      await userCollection.doc(uidOfUser.toString()).update({
        'bookmarks': FieldValue.arrayUnion([photoId]),
      });
      return 0;
    } catch (e) {
      print(e.toString());
    }
    return 2;
  }

  Future<int> likeOrDisLikePhoto(dynamic photoId) async {
    try {
      final Map<String, dynamic> querySnapshot =
          (await photoCollection.doc(photoId.toString()).get()).data();
      if (querySnapshot.isEmpty) {
        print(querySnapshot);
        return 2;
      }
      final Photo photoSnapshot = Photo.fromMap(querySnapshot);

      if (photoSnapshot.likedUsers.contains(uidOfUser as dynamic)) {
        await photoCollection.doc(photoId.toString()).update({
          'likes': photoSnapshot.likes - 1,
          'likedUsers': FieldValue.arrayRemove([uidOfUser]),
        });
        await userCollection.doc(uidOfUser.toString()).update({
          'likedPhotos': FieldValue.arrayRemove([photoId]),
        });
        return 1;
      } else {
        await photoCollection.doc(photoId.toString()).update({
          'likes': photoSnapshot.likes + 1,
          'likedUsers': FieldValue.arrayUnion([uidOfUser.toString()]),
        });
        await userCollection.doc(uidOfUser.toString()).update({
          'likedPhotos': FieldValue.arrayUnion([photoId.toString()]),
        });
        return 0;
      }
    } catch (e) {
      print(e.toString());
    }
    return 2;
  }

  Future<Object> fetch(
      {bool reset, Type type, CollectionReference collectionReference}) async {
    if (reset) {
      last = null;
      moreAvail = true;
    }
    List<DocumentSnapshot> data;
    List<DocumentSnapshot> data2;

    switch (type) {
      case Type.loadPhotos:
        if (last != null) {
          data = await _fetchMorePhotos(collectionReference);
        } else {
          data = await _fetchPhotos(collectionReference);
        }
        if (data != null) {
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.savedPhotos:
        if (last == null) {
          data = await _fetchSavePhotos(collectionReference);
        } else {
          data = await _fetchMoreSavePhotos(collectionReference);
        }
        if (data != null) {
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.likedPhots:
        if (last == null) {
          data = await _fetchLikePhotos(collectionReference);
        } else {
          data = await _fetchMoreLikePhotos(collectionReference);
        }

        if (data != null) {
          while (data.length != likedPostsOfUser.length && data.length > 0) {
            for (DocumentSnapshot ele in data) {
              if (!likedPostsOfUser.contains(ele.id as dynamic)) {
                data.remove(ele);
              }
            }
          }
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.shotPhotos:
        if (last == null) {
          data = await _fetchShotPhotos(collectionReference);
        } else {
          data = await _fetchMoreShotPhotos(collectionReference);
        }
        if (data != null) {
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
    }
    return null;
  }

  Future<List<DocumentSnapshot>> _fetchSavePhotos(
      CollectionReference collection) async {
    print('Inside savephts method');
    final Query query =
        collection.orderBy('timeStamp', descending: true).limit(limit);
    final QuerySnapshot snapshot = await query.get();
    last = snapshot.docs[snapshot.docs.length - 1];
    return snapshot.docs;
  }

  Future<List<DocumentSnapshot>> _fetchMoreSavePhotos(
      CollectionReference collection) async {
    print('fetch more save func');
    if (moreAvail) {
      final Query query = collection
          .orderBy('timeStamp', descending: true)
          .startAfter([last.data()['timeStamp']]).limit(limit);

      final QuerySnapshot snapshot = await query.get();
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

  Future<List<DocumentSnapshot>> _fetchLikePhotos(
      CollectionReference collection) async {
    print('Inside fetch like photos method');
    final Query query =
        collection.orderBy('timeStamp', descending: true).limit(limit);
    final QuerySnapshot snapshot = await query.get();
    last = snapshot.docs[snapshot.docs.length - 1];
    return snapshot.docs;
    // List<DocumentSnapshot> phts;
    // snapshot.docs.forEach((element) {
    //   if (likedPostsOfUser.contains(element.id as dynamic)) {
    //     phts.add(element);
    //   }
    // });
    // last = snapshot.docs[snapshot.docs.length - 1];
    // return phts;
  }

  Future<List<DocumentSnapshot>> _fetchMoreLikePhotos(
      CollectionReference collection) async {
    print('fetch more likephotos func');
    if (moreAvail) {
      final Query query = collection
          .orderBy('timeStamp', descending: true)
          .startAfter([last.data()['timeStamp']]).limit(limit);

      final QuerySnapshot snapshot = await query.get();
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

  Future<List<DocumentSnapshot>> _fetchShotPhotos(
      CollectionReference collection) async {
    print('Inside fetchshotphotos method');
    final Query query =
        collection.orderBy('timeStamp', descending: true).limit(limit);
    final QuerySnapshot snapshot = await query.get();
    // List<DocumentSnapshot> phts;
    // // ignore: avoid_function_literals_in_foreach_calls
    // snapshot.docs.forEach((element) {
    //   if (postsOfUser.contains(element.id as dynamic)) {
    //     phts.add(element);
    //   }
    // });
    last = snapshot.docs[snapshot.docs.length - 1];
    return snapshot.docs;
  }

  Future<List<DocumentSnapshot>> _fetchMoreShotPhotos(
      CollectionReference collection) async {
    print('fetch more shotphotos func');
    if (moreAvail) {
      final Query query = collection
          .orderBy('timeStamp', descending: true)
          .startAfter([last.data()['timeStamp']]).limit(limit);

      final QuerySnapshot snapshot = await query.get();
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

  Future<List<DocumentSnapshot>> _fetchPhotos(
      CollectionReference collection) async {
    print('Inside fetchphotos method');
    final Query query =
        collection.orderBy('timeStamp', descending: true).limit(limit);
    final QuerySnapshot snapshot = await query.get();
    final List<DocumentSnapshot> phts = snapshot.docs;
    last = snapshot.docs[phts.length - 1];
    return phts;
  }

  Future<List<DocumentSnapshot>> _fetchMorePhotos(
      CollectionReference collection) async {
    print('fetch more photos func');
    if (moreAvail) {
      final Query query = collection
          .orderBy('timeStamp', descending: true)
          .startAfter([last.data()['timeStamp']]).limit(limit);

      final QuerySnapshot snapshot = await query.get();
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
