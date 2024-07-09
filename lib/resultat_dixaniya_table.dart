import 'package:cor/utils/extension/date_time_format.dart';
import 'package:flutter/material.dart';
import 'data/model/dixaniya_model.dart';
import 'main.dart';

class ResultDixaniyaScreen extends StatelessWidget {
  final List<DixaniyaModel> resultats;

  const ResultDixaniyaScreen({super.key, required this.resultats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Center(
                    child: Text(
                      'Тренинг дыхания',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        '№ Тренировки',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                        label: Text(
                      'Дата',
                          overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    DataColumn(
                      label: Text(
                        'Ритм дыхания',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                  rows: List<DataRow>.generate(
                    resultats.length,
                    (index) {
                      final resultat = resultats[index];
                      return DataRow(cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(
                          Text(
                            resultat.createdDate.toCustomFormat(),
                          ),
                        ),
                        DataCell(Text(resultat.title)),
                        // Assuming title contains the breathing rhythm, you can adjust it if needed.
                      ]);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                      const MyHomePage(title: 'Коррекция речи'),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  margin: EdgeInsets.only(
                    top: 12,
                  ),
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(33, 150, 83, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Center(
                      child: Text(
                        "Далее",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
