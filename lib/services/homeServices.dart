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
    int i = 0;
    if (last != null) {
      data = await _fetchMorePhotos(collectionReference);
    } else {
      data = await _fetchPhotos(collectionReference);
    }
    switch (type) {
      case Type.loadPhotos:
        if (data != null) {
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.savedPhotos:
        if (data != null) {
          while (i < 10) {
            i++;
            for (final DocumentSnapshot ele in data) {
              if (!savedPostsOfUser.contains(ele.id as dynamic)) {
                data.remove(ele);
              }
            }
          }
          i = 0;
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.likedPhots:
        if (data != null) {
          while (i < 10) {
            i++;
            for (final DocumentSnapshot ele in data) {
              if (!likedPostsOfUser.contains(ele.id as dynamic)) {
                data.remove(ele);
              }
            }
          }
          i = 0;
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
      case Type.shotPhotos:
        if (data != null) {
          while (i < 10) {
            i++;
            for (final DocumentSnapshot ele in data) {
              if (!postsOfUser.contains(ele.id as dynamic)) {
                data.remove(ele);
              }
            }
          }
          i = 0;
          return PhotoModel.fromDocumentSnapshot(data);
        }
        return null;
    }
    return null;
  }

  Future<List<DocumentSnapshot>> _fetchPhotos(
      CollectionReference collection) async {
    print('Inside fetchphotos method');
    final Query query =
        collection.orderBy('timeStamp', descending: true).limit(limit);
    final QuerySnapshot snapshot = await query.get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
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
      if (snapshot.docs.isEmpty) {
        return null;
      }
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
