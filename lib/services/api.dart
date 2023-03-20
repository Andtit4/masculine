// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  initializeEndPoint(middlware, endpoint) async {
    final url = "https://itchy-woolens-toad.cyclic.app/$middlware/$endpoint";
    // final middlewarre = ""
    return url;
  }

  insertOtp(nomuser, prenomuser, telephoneuser) async {
    const middleware = "api/user";
    const endpoint = "create";

    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.post(Uri.parse(apiUrl), body: {
      'nomuser': nomuser,
      'prenomuser': prenomuser,
      'telephoneuser': telephoneuser
    });

    if (response.statusCode == 200) {
      print('___INSERT___SUCCESS___');
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  alreadyExiste(telephoneuser) async {
    const middleware = "api/user";
    var endpoint = "nb?telephoneuser=${telephoneuser.toString()}";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print("___INSERT___SUCCESS___${jsonData[0]['nb']}");
      return jsonData[0]['nb'];
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  insertDemande(
    titre,
    description,
    montant,
    date_debut,
    date_fin,
    telephoneuser,
  ) async {
    const middleware = "api/rdv";
    var endpoint = "create";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.post(Uri.parse(apiUrl), body: {
      'titre': titre.toString(),
      'description': description.toString(),
      'montant': montant.toString(),
      'date_debut': date_debut.toString(),
      'date_fin': date_fin.toString(),
      'telephoneuser': telephoneuser.toString()
    });

    if (response.statusCode == 200) {
      // var jsonData = json.decode(response.body);
      print("___INSERT___SUCCESS___demande");
      // return jsonData[0]['nb'];
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
