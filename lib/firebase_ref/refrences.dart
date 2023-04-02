import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firesStore = FirebaseFirestore.instance;

final questionPaperRF = firesStore.collection('questionPapers');

final userRF = firesStore.collection("users");
DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);
Reference get firebaseStorage => FirebaseStorage.instance.ref();
