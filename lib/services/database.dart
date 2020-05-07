import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rozrywka/models/book.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference usersCollection =
  Firestore.instance.collection('users');

  Future addBook(Book book) async {
    return await usersCollection.document(uid).collection('books')
        .add(book.toJson());
  }

  //books list from snapshot
  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Map<String, dynamic> dataAndID = doc.data;
      dataAndID['id'] = doc.documentID;
      print("data from Fire:  $dataAndID");
      return Book.fromJson(dataAndID);
    }).toList();
  }

  Stream<List<Book>> get books {
    //return usersCollection.snapshots();
    return usersCollection
        .document(uid)
        .collection('books')
        .snapshots()
        .map(_bookListFromSnapshot);
  }

  Future deleteBook(String bookID) async {
    return await usersCollection
        .document(uid)
        .collection('books')
        .document(bookID)
        .delete();
  }

  Future updateBookRead(String bookID, bool isRead) async {
    return await usersCollection
        .document(uid)
        .collection('books')
        .document(bookID)
        .updateData({
      'isRead': isRead,
    });
  }
}