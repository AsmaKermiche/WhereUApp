import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereuapp/Wrapper.dart';
import 'package:whereuapp/classes/Groupe.dart';
import 'package:whereuapp/classes/Message.dart';
import 'package:whereuapp/classes/Utilisateur.dart';


class Msg3Page extends StatefulWidget {
  final Group group ;
  Msg3Page({this.group});
  @override
  _Msg3PageState createState() => _Msg3PageState();
}

class _Msg3PageState extends State<Msg3Page> {

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
                  onPressed: ()  {
                    String messageAboutGroupe = "il pleut\nSoyez prudents";
                    widget.group.addMesssage(messageAboutGroupe, TypeMessage.Meteo, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                  },
                   padding :EdgeInsets.all(22.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text('il pleut\nSoyez prudents ', style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 20.0),
                  Image.asset('assets/rain.png', height:50 , width:50 ),
          ])),
            ]),
            SizedBox( height:20.0),
            Row( children :<Widget> [
             SizedBox( width:10.0),
            RaisedButton( 
                  onPressed: (){
                    String messageAboutGroupe = "il y'a du brouillard\nAttention";
                    widget.group.addMesssage(messageAboutGroupe, TypeMessage.Meteo, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                    },
                   padding :EdgeInsets.all(22.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text("il y'a du brouillard\nAttention ", style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 20.0),
                  Image.asset('assets/cloud.png', height:40 , width:40 ),
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
          'Météo',
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
