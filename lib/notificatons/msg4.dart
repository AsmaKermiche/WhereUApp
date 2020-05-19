import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereuapp/Wrapper.dart';
import 'package:whereuapp/classes/Groupe.dart';
import 'package:whereuapp/classes/Message.dart';
import 'package:whereuapp/classes/Utilisateur.dart';


class Msg4Page extends StatefulWidget {
  final Group group ;
  Msg4Page({this.group});
  @override
  _Msg4PageState createState() => _Msg4PageState();
}

class _Msg4PageState extends State<Msg4Page> {
  Utilisateur utilisateur ;
  Widget _text() {
    return Positioned(
        top: 150,
        child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


        Row( children :<Widget> [
            SizedBox( width:10.0),
        RaisedButton(
            onPressed: () {
                    String messageAboutGroupe = "Je ne peux pas\nvous rejoindre\ndans notre prochain\ntrajet.";
                    widget.group.addMesssage(messageAboutGroupe, TypeMessage.AboutGroupe, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
            },
        padding :EdgeInsets.all(40.0),

        color:  Color(0xFFF1B97A),
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
        textColor: Colors.white,
        child:
        Column( children :<Widget>[ Text('Je ne peut pas vous rejoindre', style : TextStyle(fontSize:20.0), textAlign : TextAlign.center),
          Text('dans notre prochain trajet.', style : TextStyle(fontSize:20.0), textAlign : TextAlign.center)

        ])),
    ]),
    SizedBox( height:20.0),
    Row( children :<Widget> [
    SizedBox( width:10.0),


    RaisedButton(
    onPressed: () {
    String messageAboutGroupe = "Que pensez vous\nd'un voyage commun\nle weekend prochain ? ";
    widget.group.addMesssage(messageAboutGroupe, TypeMessage.AboutGroupe, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
    },
    padding :EdgeInsets.all(40.0),

    color:  Color(0xFFF1B97A),
    shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
    textColor: Colors.white,
    child:
    Column( children :<Widget>[ Text("Que pensez vous d'un voyage", style : TextStyle(fontSize:20.0),  textAlign : TextAlign.center),
    Text("commun le weekend prochain ? ", style : TextStyle(fontSize:20.0),  textAlign : TextAlign.center),

    ])),
    ]),
    ]
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      utilisateur =Provider.of<User>(context, listen: false).utilisateur;
    });
    return Scaffold(
      backgroundColor:Color(0xffF2E9DB),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xffF2E9DB)),
        backgroundColor: Color(0xff739D84),
        title: Text(
          'Autres',
          style: TextStyle(
              color: Color(0xffF2E9DB),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          moveToLastSreen() ;
        }),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _text(),
          ],
        ),
      ),
    );
  }
  moveToLastSreen(){
    Navigator.pop(context) ;
  }
}