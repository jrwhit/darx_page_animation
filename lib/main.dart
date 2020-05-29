import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Let's go baby!!!"),
            onPressed: (){
              Navigator.of(context).push(_createRouteED());
            }
            ),
      ),
    );
  }
}
//animação ocorre de cima para baixo
Route _createRouteCB()=> PageRouteBuilder(
  pageBuilder: (context, animation, secondAnimation) => Page2(),
  transitionsBuilder: (context, animation, secondAnimation, child){
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  },
);

///animação ocorre na vertical(direita para esquerda
Route _createRouteDE()=> PageRouteBuilder(
    pageBuilder: (context, animation, secondAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondAnimation, child){
      var begin = Offset(1.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
);

//ocorre na horizontal, da direita para esquerda
Route _createRouteED()=> PageRouteBuilder(
  pageBuilder: (context, animation, secondAnimation) => Page2(),
  transitionsBuilder: (context, animation, secondAnimation, child){
    var begin = Offset(1.0, 0.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  },
);

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: Center(
        child: Text("Hello world!"),
      ),
    );
  }
}

