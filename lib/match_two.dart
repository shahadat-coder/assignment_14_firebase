
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


class MatchTwo extends StatelessWidget {
  const MatchTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Argentina Vs France'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.only(bottom: 430,top: 50),
          shadowColor: Colors.greenAccent,
          elevation: 5,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('basketball_2')
                  .doc('2_aus_vs_ind')
                  .snapshots(),
              builder:
                  (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
                print(snapshot.data?.data());
                if(snapshot.hasData) {
                  final score = snapshot.data!;
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          score.get('match_name_2'),
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  score.get('team_aus').toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                                const SizedBox(width: 5,),
                                const Text(':',style: TextStyle(fontWeight: FontWeight.bold),),
                                const SizedBox(width: 5,),
                                Text(
                                  score.get('team_ind').toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                              ],
                            ),
                            Text(
                              score.get('Time'),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              score.get('Total Time'),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('basketball_2')
                .doc('2_aus_vs_ind')
                .update({
              'match_name': "Argentina Vs France",
              'score_team_a': 10,
              'score_team_b': 11,
              'team_a':"Argentina",
              'team_b':"France"
            });
          }),
    );;
  }
}
