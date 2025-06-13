import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Below is called (data['question_index'] as int) TYPE CASTING turning , telling dart that you know more that it does
                    Container(
                      height: 17,
                      width: 17,
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: data["user_answer"] == data["correct_answer"]
                        ? const Color.fromARGB(255, 138, 203, 255)
                        : const Color.fromARGB(255, 241, 108, 153),
                      ),
                      alignment: Alignment.center, 
                      child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(data['question'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(223, 255, 255, 255),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox( height: 5,),
                        Text(data["user_answer"] as String,
                        style: TextStyle(
                           color: const Color.fromARGB(255, 202, 138, 237),
                           fontSize: 11,
                        )),
                        Text(data['correct_answer'] as String,
                        style: TextStyle(
                         color: const Color.fromARGB(255, 138, 203, 255),
                         fontSize: 11,
                        ),),
                      ],),
                    )
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
