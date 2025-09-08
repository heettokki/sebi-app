import 'package:flutter/material.dart';
import 'package:sebi/pages/activity_2.dart';

class lesson_2 extends StatelessWidget {
  const lesson_2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> phrases = [
      {"en": "Thank you", "ceb": "Salamat"},
      {"en": "You're welcome", "ceb": "Walay sapayan"},
      {"en": "Sorry", "ceb": "Pasaylo-a ko"},
      {"en": "Excuse me", "ceb": "Ekskyus"},
      {"en": "Please", "ceb": "Palihug"},
      {"en": "Yes", "ceb": "Oo"},
      {"en": "No", "ceb": "Dili"},
      {"en": "Good job", "ceb": "Maayong trabaho"},
      {"en": "Take care", "ceb": "Amping"},
      {"en": "Bless you", "ceb": "Panalanginan ka"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/sebi_logo.png',
          fit: BoxFit.cover,
          height: 60,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 243, 134, 45),
              child: CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromARGB(255, 218, 122, 154),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 85, 83, 83),
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDE89),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDE89),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cebuano",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: phrases.length + 1,
              itemBuilder: (context, index) {
                if (index == phrases.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[400],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Activity2Page(phrases: phrases),
                            ),
                          );
                        },
                        child: Text(
                          "Start Activity",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    phrases[index]["en"] ?? "",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFFFB940),
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 28,
                                color: Colors.grey[300],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    phrases[index]["ceb"] ?? "",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFFFB940),
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xFF8BC46A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
