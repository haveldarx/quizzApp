import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ninja_id/model/question.dart';

void main() => runApp(MaterialApp(
    home:ninjacard(),
    ));
class ninjacard extends StatefulWidget{
  @override
  _ninjacardState createState() => _ninjacardState();
}

class _ninjacardState extends State<ninjacard> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Is 34 a prime", true),
    Question.name('Is 5 a prime', false),
  ];
    int nooffans = 0;
    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text('QUIZZ'),
                centerTitle: true,
                backgroundColor: Colors.purpleAccent,
                 ),
            floatingActionButton: FloatingActionButton(
                    onPressed: (){
                  setState(() {
                       nooffans += 1;
                  });
            },
                child: Icon(Icons.add),
                backgroundColor: Colors.purpleAccent,
            ),
            backgroundColor: Colors.purple[100  ],
            body:Builder(
              builder: (BuildContext context) => Container(
            
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(100, 0, 50, 0),
                   child: Image.asset('assets/flag.png',
                    width: 200,
                    
                    ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(12),
                   child: Container( 
                     decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(14.4),
                       border: Border.all(
                         color: Colors.grey,
                         style: BorderStyle.solid
                       )
                     ),
                     height: 120.0,
                     child: Center(child:  Text(questionBank.elementAt(_currentQuestionIndex).questionText,
                     style: TextStyle(fontSize: 30),)), 
                   ),
                 )  ,
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     FloatingActionButton(onPressed: () => _checkAnswer(true,context),
                     
                     child: Text("TRUE"),
                     ),
                       FloatingActionButton(onPressed: () => _checkAnswer(false,context),
                     
                     child: Text("FALSE"),
                     ),
                     FloatingActionButton(onPressed: () => _nextQuestion(),
                     
                     child: Icon(
                       Icons.arrow_forward
                     ),)
                   ],
                 ) 
               ],
             ), 
            )
        ));
    }

  _checkAnswer(bool userChoice,BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      final snackbar = SnackBar(content: Text('Correct'),);
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);   
      debugPrint("yes correct");}
      else{
         final snackbar = SnackBar(content: Text('Correct'),);
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(snackbar);   
        debugPrint('incorrect');
      }
    
    }
     
  

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1)%questionBank.length;
    });
    
  }
    
}




