import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function(String, bool) selectHandler;

  final String answerText;
  final String answerId;

  final bool isMultipleChoice;
  final List<String> selectedAnswers;
  final String selectedId;


  Answer(this.selectHandler, this.answerText, this.answerId,
      this.isMultipleChoice, this.selectedId, this.selectedAnswers);

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: double.infinity,
      height: 50,
      //padding: const EdgeInsets.all(5.0),
      child: isMultipleChoice ?
        Card(
          child: RadioListTile(
            title: Text(answerText),
            dense:true,
            value: answerId,
            onChanged: (value) {
              selectHandler(value.toString(), false);
            },
            groupValue: selectedId,
      ),
        )
      :
        Card(
            child: CheckboxListTile(
              title: Text(answerText),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              onChanged: (bool? value) {
                  selectHandler(answerId,true);
                  },
              value: selectedAnswers.contains(answerId),
            )
          )


    ); //Container
  }
}

class MultipleAnswer extends StatelessWidget {
  final Function(String, bool) selectHandler;
  final Function(String) deselectHandler;

  final String answerText;
  final String answerId;

  final List<String> selectedAnswers;

  bool isSelected = false;

  MultipleAnswer(this.selectHandler, this.deselectHandler, this.answerText,
    this.answerId, this.selectedAnswers);


  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
        height: 50,
        //padding: const EdgeInsets.all(5.0),
        child: Card(
            child: CheckboxListTile(
              title: Text(answerText),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              onChanged: (bool? value) {
                if(value != null)
                  value ? selectHandler(answerId,true) : deselectHandler(answerId);
              },
              value: isSelected,
            )
        )


    ); //Container
  }
}
