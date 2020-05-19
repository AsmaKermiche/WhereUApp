import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereuapp/Wrapper.dart';
import 'package:whereuapp/classes/Groupe.dart';
import 'package:whereuapp/classes/Message.dart';
import 'package:whereuapp/classes/Utilisateur.dart';

class Msg1Page extends StatefulWidget {
  final Group group ;
  Msg1Page({this.group});
  @override
  _Msg1PageState createState() => _Msg1PageState();
}

class _Msg1PageState extends State<Msg1Page> {
  Utilisateur utilisateur ;
  Widget _text() {
    return Positioned(
      top: 80,
      child: Column(
       
       crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ 
          
         
           Row( children :<Widget> [
             SizedBox( width:5.0),
            RaisedButton(
                onPressed: () {
                  String messageAboutGroupe = 'un accident dans la route\nEvitez-la ' ;
                  widget.group.addMesssage(messageAboutGroupe, TypeMessage.EtatRoute, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                },
                   padding :EdgeInsets.all(19.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text('un accident dans la route\nEvitez-la ', style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 10.0),
                  Image.asset('assets/transport.png', height:50 , width:50 ),
          ])),
            ]),
            SizedBox( height:20.0),
            Row( children :<Widget> [
             SizedBox( width:10.0),
            RaisedButton(
                onPressed: () {
                  String messageAboutGroupe = ' une route encombrée\nEvitez-la ';
                  widget.group.addMesssage(messageAboutGroupe, TypeMessage.EtatRoute, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                },
                   padding :EdgeInsets.all(20.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text('une route encombrée\nEvitez-la ', style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 3.0),
                  Image.asset('assets/bridge.png', height:40 , width:40 ),
          ])),
            ]),
            
            
            SizedBox( height:20.0),
            Row( children :<Widget> [
             SizedBox( width:10.0),
            RaisedButton(
                onPressed: () {
                  String messageAboutGroupe = 'la route est bloquée';
                  widget.group.addMesssage(messageAboutGroupe, TypeMessage.EtatRoute, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                },
                   padding :EdgeInsets.all(20.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text('la route est bloquée ', style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 5.0),
                  Image.asset('assets/barrier.png', height:50 , width:50 ),
          ])),
            ]), SizedBox( height:20.0),
            Row( children :<Widget> [
             SizedBox( width:10.0),
            RaisedButton(
                onPressed: () {
                  String messageAboutGroupe = 'une chaussée glissante\nAttention!';
                  widget.group.addMesssage(messageAboutGroupe, TypeMessage.EtatRoute, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                },
                   padding :EdgeInsets.all(22.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text(' une chaussée glissante\nAttention!', style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 3.0),
                  Image.asset('assets/drifting.png', height:30 , width:30 ),
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
          'Etat de la route',
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
