import 'package:flutter/material.dart';

class Activity3Page extends StatefulWidget {
  final List<Map<String, String>> phrases;
  const Activity3Page({super.key, required this.phrases});

  @override
  State<Activity3Page> createState() => _Activity3PageState();
}

class _Activity3PageState extends State<Activity3Page> {
  int currentIndex = 0;
  int score = 0;
  int suns = 0;
  bool showResult = false;
  bool showFailPrompt = false;
  bool showCorrect = false;
  bool showWrong = false;
  String userAnswer = '';
  bool isMultipleChoice = false;
  int selectedChoice = -1;

  final List<List<String>> choicesList = [
    ["Usa", "Duha", "Tulo", "Upat"],
    ["Duha", "Usa", "Tulo", "Upat"],
    ["Tulo", "Duha", "Upat", "Lima"],
    ["Upat", "Tulo", "Lima", "Unom"],
    ["Lima", "Upat", "Unom", "Pito"],
    ["Unom", "Lima", "Pito", "Walo"],
    ["Pito", "Unom", "Walo", "Siyam"],
    ["Walo", "Pito", "Siyam", "Napulo"],
    ["Siyam", "Walo", "Napulo", "Usa"],
    ["Napulo", "Siyam", "Walo", "Duha"],
  ];

  @override
  void initState() {
    super.initState();
    _setQuestionType();
  }

  void _setQuestionType() {
    setState(() {
      isMultipleChoice = currentIndex % 2 == 1;
      showCorrect = false;
      showWrong = false;
      userAnswer = '';
      selectedChoice = -1;
    });
  }

  void _checkAnswer() {
    final correct = widget.phrases[currentIndex]['ceb']!;
    if (isMultipleChoice) {
      if (selectedChoice != -1 && choices()[selectedChoice] == correct) {
        score += 10;
        suns += 3;
        showCorrect = true;
        showWrong = false;
      } else {
        showWrong = true;
        showCorrect = false;
      }
    } else {
      if (userAnswer.trim().toLowerCase() == correct.toLowerCase()) {
        score += 10;
        suns += 3;
        showCorrect = true;
        showWrong = false;
      } else {
        showWrong = true;
        showCorrect = false;
      }
    }
    setState(() {});
  }

  void _nextQuestion() {
    if (currentIndex < widget.phrases.length - 1) {
      setState(() {
        currentIndex++;
        _setQuestionType();
      });
    } else {
      setState(() {
        showResult = true;
        showFailPrompt = score < (widget.phrases.length * 7.5);
      });
    }
  }

  List<String> choices() {
    if (currentIndex < choicesList.length) {
      return choicesList[currentIndex];
    }
    final correct = widget.phrases[currentIndex]['ceb']!;
    List<String> all = widget.phrases.map((e) => e['ceb']!).toList();
    all.remove(correct);
    all.shuffle();
    return ([correct] + all.take(3).toList())..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image.asset(
            'assets/sebi_logo.png',
            fit: BoxFit.cover,
            height: 60,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: const Color.fromARGB(255, 243, 134, 45),
                child: CircleAvatar(
                  radius: 21,
                  backgroundColor: const Color.fromARGB(255, 218, 122, 154),
                  child: Icon(Icons.person, color: Color(0xFF555353), size: 25),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  showFailPrompt
                      ? Icons.sentiment_dissatisfied
                      : Icons.sentiment_satisfied,
                  color: showFailPrompt ? Colors.red[300] : Color(0xFFFFD36A),
                  size: 120,
                ),
                SizedBox(height: 16),
                Text(
                  "Lesson Complete!",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xFFFFB940),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ResultBox(
                      icon: Icons.wb_sunny_rounded,
                      value: '+ $suns',
                      label: 'Suns',
                    ),
                    SizedBox(width: 18),
                    _ResultBox(
                      icon: null,
                      value:
                          '${((score / (widget.phrases.length * 10)) * 100).round()}%',
                      label: 'Score',
                    ),
                  ],
                ),
                SizedBox(height: 24),
                if (!showFailPrompt)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Proceed to next lesson",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (showFailPrompt)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8,
                        ),
                        child: Text(
                          "You need a score of 75% or more to proceed to the next lesson",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = 0;
                            score = 0;
                            suns = 0;
                            showResult = false;
                            showFailPrompt = false;
                            _setQuestionType();
                          });
                        },
                        child: Text(
                          "Repeat current lesson",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Back to home",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final phrase = widget.phrases[currentIndex];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/sebi_logo.png',
          fit: BoxFit.cover,
          height: 60,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 243, 134, 45),
              child: CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromARGB(255, 218, 122, 154),
                child: Icon(Icons.person, color: Color(0xFF555353), size: 25),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: LinearProgressIndicator(
                      value: (currentIndex + 1) / widget.phrases.length,
                      backgroundColor: Colors.grey[200],
                      color: Color(0xFFFFB940),
                      minHeight: 7,
                    ),
                  ),
                ),
                Text(
                  "Score: ${(score / (widget.phrases.length * 10) * 100).round()}%",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  phrase['en']!,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Color(0xFFFFB940),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  phrase['ceb']!.contains(' ') && !isMultipleChoice
                      ? "${phrase['ceb']!.split(' ').first} ______"
                      : isMultipleChoice
                      ? ""
                      : "______",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xFFFFB940),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  phrase['en']!,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          if (!isMultipleChoice)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                onChanged: (val) => setState(() => userAnswer = val),
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22,
                  color: Color(0xFFFFB940),
                ),
                decoration: InputDecoration(
                  hintText: 'Type your answer',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: 'Nunito',
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFB940)),
                  ),
                ),
              ),
            ),
          if (isMultipleChoice)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: List.generate(choices().length, (i) {
                  final choice = choices()[i];
                  Color borderColor = Colors.grey[400]!;
                  Color fillColor = Colors.white;
                  Color textColor = Color(0xFFFFB940);

                  if (showCorrect &&
                      selectedChoice == i &&
                      choice == phrase['ceb']) {
                    fillColor = Color(0xFF8BC46A);
                    textColor = Colors.white;
                  } else if (showWrong && selectedChoice == i) {
                    fillColor = Colors.red[300]!;
                    textColor = Colors.white;
                  } else if (showWrong && choice == phrase['ceb']) {
                    fillColor = Color(0xFF8BC46A);
                    textColor = Colors.white;
                  } else if (selectedChoice == i) {
                    fillColor = Color(0xFFFFF3E0);
                    borderColor = Color(0xFFFFB940);
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Material(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(24),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: (!showCorrect && !showWrong)
                            ? () {
                                setState(() {
                                  selectedChoice = i;
                                });
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          Spacer(),
          if (showCorrect || showWrong)
            Container(
              width: double.infinity,
              color: showCorrect ? Color(0xFF8BC46A) : Colors.red[200],
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    showCorrect ? "Correct!" : "Wrong!",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: _nextQuestion,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: showCorrect
                            ? Color.fromARGB(255, 59, 155, 4)
                            : Colors.red[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (!showCorrect && !showWrong)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFB940),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _checkAnswer,
                child: Text(
                  "Check",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ResultBox extends StatelessWidget {
  final IconData? icon;
  final String value;
  final String label;
  const _ResultBox({this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFEDEDED), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: Color(0xFFFFB940), size: 32),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color(0xFFFFB940),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 15,
              color: Colors.orange[300],
            ),
          ),
        ],
      ),
    );
  }
}
