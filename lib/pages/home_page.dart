import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app_api/model/team.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Team> teams = [];

  //Get Teams
  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NBA TEAMS", style: TextStyle(
          color: Colors.white
        )),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: ListTile(
                        title: Text(teams[index].abbreviation),
                        subtitle: Text(teams[index].city),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
