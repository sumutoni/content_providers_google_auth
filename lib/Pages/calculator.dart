import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _HomeState();
}

class _HomeState extends State<Calculator> {
  String displayText = '0';
  dynamic finalResult = 0;
  double fnum = 0;
  double snum = 0;
  String op = '';
  String preOp = '';

  Widget calcbutton(String text, Color btncolor, Color textcolor){
    return ButtonTheme(

      child: TextButton(onPressed: (){
        calculation(text);
      },
        style: TextButton.styleFrom(backgroundColor: btncolor, shape: const CircleBorder(),),  
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: 35.0),
        ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                displayText,
                style:const TextStyle( fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
            ButtonBar(
              buttonPadding: const EdgeInsets.all(15),
              children: <Widget>[
                
                calcbutton('C', const Color.fromRGBO(179, 175, 175, 0.986), Colors.black),
                calcbutton('AC', const Color.fromRGBO(179, 175, 175, 0.986), Colors.black),
                calcbutton('+/-', const Color.fromRGBO(179, 175, 175, 0.986), Colors.black),
                calcbutton('/', const Color.fromARGB(248, 15, 184, 127), Colors.black),
              ],
            ),
          ButtonBar(
            buttonPadding: const EdgeInsets.all(15),
            children: <Widget>[
              calcbutton('7', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('8', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('9', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('x', const Color.fromARGB(248, 15, 184, 127), Colors.black),
            ],
          ),
          ButtonBar(
            buttonPadding: const EdgeInsets.all(15),
            children: <Widget>[
              calcbutton('4', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('5', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('6', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('-', const Color.fromARGB(248, 15, 184, 127), Colors.black),
            ],
          ),
          ButtonBar(
            buttonPadding: const EdgeInsets.all(15),
            children: <Widget>[
              calcbutton('1', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('2', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('3', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('+', const Color.fromARGB(248, 15, 184, 127), Colors.black),
            ],
          ),
          ButtonBar(
            buttonPadding: const EdgeInsets.all(15),
            children: <Widget>[
              calcbutton('%', const Color.fromARGB(255, 15, 105, 83), Colors.white),
              calcbutton('0', const Color.fromARGB(129, 97, 63, 136), Colors.white),
              calcbutton('.', const Color.fromARGB(255, 15, 105, 83), Colors.white),
              calcbutton('=', const Color.fromARGB(248, 15, 184, 127), Colors.black),
            ],
          ),
          ]
          ),
        ],
      )
    );
  }

  void calculation(String text){
    if (text == '+' || text == '-' || text == '/' || text == 'x'){
      fnum = double.parse(displayText);    
      op = text; 
      setState(() {
        displayText = '0';
      });
    }
    if (text == '='){
      snum = double.parse(displayText);
      if(op == '+') {
      add();
      finalResult = doesContainDecimal(finalResult);
      setState(() {
        displayText = finalResult.toString();
      });
      
      
      }else if( op == '-') {
        sub();
        finalResult = doesContainDecimal(finalResult);
        setState(() {
            displayText = finalResult.toString();
          });
          
      }else if( op == 'x') {
        mult();
        finalResult = doesContainDecimal(finalResult);
        setState(() {
            displayText = finalResult.toString();
          });

      }else if( op == '/') {
        div();
        finalResult = doesContainDecimal(finalResult);
        setState(() {
            displayText = finalResult.toString();
          });
        
      } 
      op = text;
    }
    else if (text == '+/-')
    {
        setState(() {
          displayText.startsWith('-')? displayText = displayText.substring(1):displayText = '-$displayText';
        }); 
    }
    else if (text == '%'){
      finalResult = double.parse(displayText) / 100;
      setState(() {
            displayText = finalResult.toString();
          });
    }
    else if (text == '.')
    {
        setState(() {
          displayText.contains('.')?displayText = displayText:displayText = '$displayText.';
        }); 
    }
    else if (text == 'AC'){
      fnum = 0;
      snum = 0;
      finalResult = 0;
      op='';
      preOp = '';
      setState(() {
      displayText = '0';
      });
    }
    else if (text == 'C'){
      setState(() {
      displayText = '0';
      });
    }
    else{
      if (text != '+' && text != '-' && text != '/' && text != 'x'){
        if (displayText == '0'){
          setState(() {
            displayText = text;
          });
        }
        else{
          
            setState(() {
              if (op=='='){
                op = '';
                displayText = text;
              }
              else{
                displayText = '$displayText$text';
              }
              
            });
          }
      }
    }
  }

  void add(){
    finalResult = fnum + snum;
    
  }
  void sub(){
    finalResult = fnum - snum;
  }
  void mult(){
    finalResult = fnum * snum;
  }
    
  void div(){
    finalResult = fnum / snum;
  }
  
  dynamic doesContainDecimal(dynamic result){
    if (result.toString().contains('.')){
      List<String> decimals = result.toString().split('.');
      if ((int.parse(decimals[1]) == 0)){
          return result = int.parse(decimals[0]);
      }
      return result;
    }
    return result;
  }
}
