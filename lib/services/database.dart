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

  Future updateBooksData(
      String forename,
      String surname,
      String title,
      String category,
      String publishedDate,
      String publisher,
      String pages,
      String isbn) async {
    return await usersCollection
        .document(uid)
        .collection('books')
        .document()
        .setData({
      'forename': forename,
      'surname': surname,
      'title': title,
      'category': category,
      'published_date': publishedDate,
      'publisher': publisher,
      'pages': pages,
      'isbn': isbn
    });
  }

  //books list from snapshot
  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Book(
        forename: doc.data['forename'] ?? '',
        surname: doc.data['surname'] ?? '',
        title: doc.data['title'] ?? '',
        category: doc.data['category'] ?? '',
        publishedDate: doc.data['published_date'] ?? '',
        publisher: doc.data['publisher'] ?? '',
        pages: doc.data['pages'] ?? '',
        isbn: doc.data['isbn'] ?? '',
      );
    }).toList();
  }

  Stream<List<Book>> get books {
    //return usersCollection.snapshots();
    return usersCollection.document(uid).collection('books').snapshots()
        .map(_bookListFromSnapshot);
  }
}
