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

  Future addBook(String forename,
      String surname,
      String title,
      String category,
      String publishedDate,
      String publisher,
      String pages,
      String isbn,
      bool isRead) async {
    return await usersCollection.document(uid).collection('books').add({
      'forename': forename,
      'surname': surname,
      'title': title,
      'category': category,
      'published_date': publishedDate,
      'publisher': publisher,
      'pages': pages,
      'isbn': isbn,
      'is_read': isRead,
    });
  }

  //books list from snapshot
  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Book(
        id: doc.documentID,
        forename: doc.data['forename'] ?? '',
        surname: doc.data['surname'] ?? '',
        title: doc.data['title'] ?? '',
        category: doc.data['category'] ?? '',
        publishedDate: doc.data['published_date'] ?? '',
        publisher: doc.data['publisher'] ?? '',
        pages: doc.data['pages'] ?? '',
        isbn: doc.data['isbn'] ?? '',
        isRead: doc.data['isRead'] ?? true,
      );
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
      'is_read': isRead,
    });
  }
}