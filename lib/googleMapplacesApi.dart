import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class GoogleMapPlacesApi extends StatefulWidget {
  const GoogleMapPlacesApi({super.key});
  @override
  State<GoogleMapPlacesApi> createState() => _GoogleMapPlacesApiState();
}

class _GoogleMapPlacesApiState extends State<GoogleMapPlacesApi> {
  TextEditingController controller = TextEditingController();
  var uuid = const Uuid().v4();
  List<dynamic> places = [];
  String _sessionToken = '12345';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid;
      });
    } else {
      getSuggestions(controller.text);
    }
  }

  void getSuggestions(String input) async {
    String kPLACES_API_KEY = 'AIzaSyC4QfSfNEEmdiT9Jrh5xjmqczEN8CAg4Os';
    String baseURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    if (kDebugMode) {
      print(response.body.toString());
    }
    if (response.statusCode == 200) {
      setState(() {
        places = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: controller,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            setState(() {
                              controller.text =
                                  places[index]['description'].toString();
                            });
                          },
                          title: Text(places[index]['description'].toString()));
                    }))
          ],
        ),
      ),
    );
  }
}
