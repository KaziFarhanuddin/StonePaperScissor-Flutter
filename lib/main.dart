import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new MyHome(),
      routes: <String, WidgetBuilder>{
        "/game":(BuildContext context) => new Game(),
      },
    )
  );
}

class Game extends StatefulWidget{
  @override
  GameState createState() => new GameState(); 
}

class GameState extends State<Game>{
  String humanChoice = "";
  String pcChoice = "";
  String result = "START";
  var map = ["STONE","PAPER","SCISSORS"];
  var colorer = Colors.orangeAccent;
  var resultColor = Colors.black;
  var colorerTB = Colors.orange;
  int humanScore = 0;
  int computerScore = 0; 

  void reset(){
    humanScore = 0;
    computerScore = 0;
    setState(() {
      result = "STSRT";
      humanChoice = "";
      pcChoice = "";
      resultColor = Colors.black;
      humanScore = 0;
      computerScore = 0;
    });
  }

  void choose(String choices){
    String resultTemp;
    map.shuffle();
    String pcTemp=map[0];
    var colorTemp = Colors.black; 

    if (pcTemp == choices) 
      {
      resultTemp = "TIE";
      colorTemp = Colors.black;
      }  
    else if ((choices == "STONE" && pcTemp == "SCISSORS") || (choices == "PAPER" && pcTemp == "STONE" )||(choices == "SCISSORS" && pcTemp == "PAPER" ))
      {
        resultTemp = "YOU WIN";
        colorTemp = Colors.green;
        humanScore++;
      }
    else 
    {
      resultTemp = "YOU LOST";
      colorTemp = Colors.red;
      computerScore++;
    }
    


    setState(() {
      result = resultTemp;
      humanChoice = choices;
      pcChoice = pcTemp;
      resultColor = colorTemp;
      humanScore = humanScore;
      computerScore = computerScore;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title: new Text("Stone Paper Scissors"),backgroundColor: colorerTB,),
      body: new Material(
        child: new Container(
          padding: new EdgeInsets.only(top:  20.0),
          child: new Center(
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                new Expanded(
                  child:new Center(
                    child: Text(result,style: TextStyle(fontSize: 60.0,color: resultColor) )),) , 
                new Expanded(
                  child:new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(child :new Center(child: new Text(humanChoice, style: TextStyle(fontSize: 30.0),)),), 
                      new Expanded(child :new Center(child: new Text(" VS ", style: TextStyle(fontSize: 30.0),)),), 
                      new Expanded(child :new Center(child: new Text(pcChoice, style: TextStyle(fontSize: 30.0),)),), 
                    ],
                  ),
                ),

                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(child :new Center(child: new Text("YOU", style: TextStyle(fontSize: 30.0,color: Colors.green),)),), 
                      new Expanded(child :new Center(child: new Text("ANDROID", style: TextStyle(fontSize: 30.0,color: Colors.red),)),), 
                    ],
                  ),

                new Expanded(
                  child:new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(child :new Center(child: new Text(humanScore.toString(), style: TextStyle(fontSize: 30.0),)),), 
                      new Expanded(child :new Center(child: new Text(computerScore.toString(), style: TextStyle(fontSize: 30.0),)),), 
                    ],
                  ),
                ),

                new Expanded(
                  child:new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(child :new Material(color: colorer,child: InkWell(onTap: () => choose("STONE") ,child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[new Text("STONE")],),)),) ,
                      new Expanded(child :new Material(color: colorer,child: InkWell(onTap: () => choose("PAPER") ,child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[new Text("PAPER")],),)),) ,
                      new Expanded(child :new Material(color: colorer,child: InkWell(onTap: () => choose("SCISSORS") ,child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[new Text("SCISSORS")],),)),) ,
                    ],
                  )
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Expanded(child :new Material(color: colorerTB,child:new Container(padding: new EdgeInsets.symmetric(vertical: 20.0),child:new  InkWell(onTap: () => reset() ,child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[new Text("RESET")],),)),) ,),
                  ],
                  ) ,
              ], 
            )
          ),
        ),
      ),
    );
  }
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
        color: Colors.orange,
        child:new InkWell(
          onTap: (){Navigator.of(context).pushNamed("/game");},
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Stone Paper Scissors", style: TextStyle(fontSize: 30.0),),
                new Text("Tab to Start")
              ],
            ),
          ),
      )
    );
  }
}