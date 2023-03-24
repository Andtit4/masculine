// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masculine/models/message.dart';
import 'package:masculine/models/notification.dart';
import 'package:masculine/models/rdv.model.dart';

class Api extends StatefulWidget {
  Api({super.key});

  List<RdvModel> rdv = [];
  List<Message> message = [];
  List<NotificationModel> notifications = [];

  initializeEndPoint(middlware, endpoint) async {
    // final url = "https://masuline-grkb.onrender.com/$middlware/$endpoint";
    final url = "http://192.168.100.40:3000/$middlware/$endpoint";

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
      'telephoneuser': telephoneuser,
      'type_compte': 'USER'
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

  // NOTIFICATIONS
  insertnotif(telephoneuser, content) async {
    const middleware = "api/notif";
    var endpoint = "create";
    String apiUrl = await initializeEndPoint(middleware, endpoint);
    var response = await http.post(Uri.parse(apiUrl), body: {
      'telephoneuser': telephoneuser.toString(),
      'content': content.toString(),
    });

    if (response.statusCode == 200) {
      // var jsonData = json.decode(response.body);
      print("___INSERT___SUCCESS___NOTIFICATION");
      // return jsonData[0]['nb'];
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  getNotif(telephoneuser) async {
    const middleware = "api/notif";
    var endpoint = "all?telephoneuser=$telephoneuser";
    String apiUrl = await initializeEndPoint(middleware, endpoint);
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // print("___NUMBER__$telephoneuser");
      print("ALL___DATA___GET");
      print("__DATA___${jsonData}");
      notifications = (jsonData as List<dynamic>)
          .map((json) => NotificationModel.fromJson(json))
          .toList();

      return notifications;
      // return jsonData;
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
      'telephoneuser': telephoneuser.toString(),
      'status': 'En attente'
    });

    if (response.statusCode == 200) {
      // var jsonData = json.decode(response.body);
      insertnotif(telephoneuser,
          'Vous avez fait une demande de $titre pour le montant de $montant ce $date_debut');

      print("___INSERT___SUCCESS___demande");
      // return jsonData[0]['nb'];
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  getTypeUser(telephoneuser) async {
    const middleware = "api/user";
    var endpoint = "?telephoneuser=${telephoneuser.toString()}";
    String apiUrl = await initializeEndPoint(middleware, endpoint);
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print("______TYPE___${jsonData[0]['type_compte'].toString()}");
      var type = jsonData[0]['type_compte'].toString();
      return type;
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  Future getAll() async {
    const middleware = "api/rdv";
    var endpoint = "all";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      // print("___NUMBER__$telephoneuser");
      print("ALL___DATA___GET");
      print("__DATA___${jsonData}");
      rdv = (jsonData as List<dynamic>)
          .map((json) => RdvModel.fromJson(json))
          .toList();

      return rdv;
      // return jsonData;
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  Future getDemandeBy(telephoneuser) async {
    const middleware = "api/rdv";
    var endpoint = "?telephoneuser=$telephoneuser";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print("___NUMBER__$telephoneuser");
      print("___DATA___GET");
      print("__DATA___${jsonData}");
      rdv = (jsonData as List<dynamic>)
          .map((json) => RdvModel.fromJson(json))
          .toList();

      return rdv;
      // return jsonData;
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  updateRdv(date_debut, date_fin, date_create, telephoneuser, id_rdv) async {
    const middleware = "api/rdv";
    var endpoint = "update";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.put(Uri.parse(apiUrl), body: {
      'date_debut': date_debut.toString(),
      'date_fin': date_fin.toString(),
      'date_create': date_create.toString(),
      'telephoneuser': telephoneuser.toString(),
      'id_rdv': id_rdv.toString()
    });

    if (response.statusCode == 200) {
      print('___UPDATED____');
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  updateStatus1(id_rdv) async {
    const middleware = "api/rdv";
    var endpoint = "update/status";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.put(Uri.parse(apiUrl),
        body: {'status': 'Reçu', 'id_rdv': id_rdv.toString()});

    if (response.statusCode == 200) {
      print('___UPDATED____');
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  addMessage(from_num, to_num, content, nom, id_rdv) async {
    const middleware = "api/message";
    var endpoint = "create";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.post(Uri.parse(apiUrl), body: {
      'from_num': from_num.toString(),
      'to_num': to_num.toString(),
      'content': '${nom.toString()}:  ${content.toString()}',
      'id_rdv': id_rdv.toString()
    });
    if (response.statusCode == 200) {
      print('___MESSAGE_SEND____');
    } else {
      print('___ERROR __WHILE__SENDING____${response.statusCode}');
    }
  }

  getMessageBy(id_rdv, from_num) async {
    const middleware = "api/message";
    var endpoint = "?id_rdv=$id_rdv&from_num=$from_num";
    String apiUrl = await initializeEndPoint(middleware, endpoint);

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print('___UPDATED____');
      var jsonData = json.decode(response.body);
      // print("___NUMBER__$telephoneuser");
      print("___MESSAGE");
      print("__DATA___${jsonData}");
      message = (jsonData as List<dynamic>)
          .map((json) => Message.fromJson(json))
          .toList();
      return message;
    } else {
      print('___ERROR____${response.statusCode}');
    }
  }

  deleteRdv(id_rdv) async {
    const middleware = "api/rdv";
    var endpoint = "?id_rdv=$id_rdv";
    String apiUrl = await initializeEndPoint(middleware, endpoint);
    var response = await http.delete(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print('___DELETED____');
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
