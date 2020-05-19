import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'authentication/Connection.dart';
import 'authentication/Inscription.dart';


class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/video2.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      home: SafeArea(
        child: Scaffold(
          // TODO 6: Create a Stack Widget
            body: Stack(
              children: <Widget>[
                // TODO 7: Add a SizedBox to contain our video.
                SizedBox.expand(
                  child: FittedBox(
                    // If your background video doesn't look right, try changing the BoxFit property.
                    // BoxFit.fill created the look I was going for.
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller.value.size?.width ?? 0,
                      height: _controller.value.size?.height ?? 0,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                Positioned(

                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Register())),

                    child: Container(

                      height: 45,

                      decoration: BoxDecoration(

                        gradient: LinearGradient(

                          colors: [

                            Color(0xFFF1B97A),

                            Color(0xFFE8652D),

                          ],

                          begin: Alignment.topLeft,

                          end: Alignment.bottomRight,

                        ),

                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.black12,

                            offset: Offset(5, 5),

                            blurRadius: 10,

                          )

                        ],

                      ),

                      child: Center(

                        child: Text(

                          'Commencer',
                          style: TextStyle(

                            color: Colors.white,

                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,

                          ),

                        ),

                      ),

                    ),

                  ),

                  bottom: 85,

                  right: 60,

                  left: 60,

                ),
                Positioned(
                  bottom: 13,
                  left: 35,

                  child:
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Connection())),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vous avez déjà un compte? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Se connecter',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: Color(0xFFE8652D),
                                  offset: Offset(0.00, 3.00),
                                  blurRadius: 6,)] ,
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),),
                Positioned(
                    top:40,

                    child:
                    Text(
                        " Où que vous soyez, nous vous joignons ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    )
                )
              ],
            )
        ),
      ),

      //LoginWidget()

    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}