import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference usersCollection =
  Firestore.instance.collection('users');

  Future addItem(Map<String, dynamic> itemJS, String tableName)async {
    return await usersCollection.document(uid).collection(tableName)
        .add(itemJS);
  }
  Future deleteItem(ItemCard item) async {
    return await usersCollection
        .document(uid)
        .collection(item.tableName)
        .document(item.id)
        .delete();
  }
  Future updateItemDone(ItemCard item, bool isDone) async {
    return await usersCollection
        .document(uid)
        .collection(item.tableName)
        .document(item.id)
        .updateData({
      'isDone': isDone,
    });
  }
  Future updateItem(Map<String, dynamic> itemJS, String tableName) async{
    return await usersCollection
        .document(uid)
        .collection(tableName)
        .document(itemJS['id'])
        .updateData(itemJS);
  }
  //book
  //books list from snapshot
  List<Book> _bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Map<String, dynamic> dataAndID = doc.data;
      dataAndID['id'] = doc.documentID;
      print("Database: fetch book");
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

  //game
  List<Game> _gameListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Map<String, dynamic> dataAndID = doc.data;
      dataAndID['id'] = doc.documentID;
      print("Database: fetch game");
      return Game.fromJson(dataAndID);
    }).toList();
  }
  Stream<List<Game>> get games {
    //return usersCollection.snapshots();
    return usersCollection
        .document(uid)
        .collection('games')
        .snapshots()
        .map(_gameListFromSnapshot);
  }

  //movie
  List<Movie> _movieListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Map<String, dynamic> dataAndID = doc.data;
      dataAndID['id'] = doc.documentID;
      print("Database: fetch movie");
      return Movie.fromJson(dataAndID);
    }).toList();
  }
  Stream<List<Movie>> get movies {
    //return usersCollection.snapshots();
    return usersCollection
        .document(uid)
        .collection('movies')
        .snapshots()
        .map(_movieListFromSnapshot);
  }

  //series
  List<Series> _seriesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      Map<String, dynamic> dataAndID = doc.data;
      dataAndID['id'] = doc.documentID;
      print("Database: fetch one series");
      return Series.fromJson(dataAndID);
    }).toList();
  }
  Stream<List<Series>> get series {
    //return usersCollection.snapshots();
    return usersCollection
        .document(uid)
        .collection('series')
        .snapshots()
        .map(_seriesListFromSnapshot);
  }
}