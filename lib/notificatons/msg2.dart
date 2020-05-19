import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereuapp/Wrapper.dart';
import 'package:whereuapp/classes/Groupe.dart';
import 'package:whereuapp/classes/Message.dart';
import 'package:whereuapp/classes/Utilisateur.dart';


class Msg2Page extends StatefulWidget {
  final Group group ;
  Msg2Page({this.group});
  @override
  _Msg2PageState createState() => _Msg2PageState();
}

class _Msg2PageState extends State<Msg2Page> {

  Utilisateur utilisateur ;
  Widget _text() {
    return Positioned(
      top: 200,
      child: Column(
       
       crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ 
          
         
               
           
            Row( children :<Widget> [
             SizedBox( width:10.0),
            RaisedButton(
                onPressed: () {
                  String messageAboutGroupe = "Réduire votre vitesse,SVP";
                  widget.group.addMesssage(messageAboutGroupe, TypeMessage.Vitesse, utilisateur.sharableUserInfo.id, utilisateur.sharableUserInfo.displayName);
                },
                   padding :EdgeInsets.all(20.0),
                  
                color:  Color(0xFFF1B97A),
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0),),
                  textColor: Colors.white,
                  child:
                  Row( children :<Widget>[ Text("Réduire votre vitesse,SVP ", style : TextStyle(fontSize:20.0),),
                  SizedBox( width: 6.0),
                  Image.asset('assets/speedometer.png', height:40 , width:40 ),
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
          'Vitesse',
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
