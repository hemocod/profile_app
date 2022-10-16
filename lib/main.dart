// ignore_for_file: deprecated_member_use, prefer_function_declarations_over_variables, dead_code

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
    home:MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor:  const Color.fromARGB(255, 56, 7, 70),
      appBar: AppBar(
        leading: const ImageIcon(
          AssetImage('asset/images/ibrahimm.png'),
          
        ), 
          



        backgroundColor: const Color.fromARGB(255, 233, 176, 140),
        elevation: 0,
        title: const Text(
          '  flutter developer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget> [
          Link(
            target: LinkTarget.blank,
            uri: Uri.parse(
                'https://hemocod.github.io/developer/'),
            builder: (context, followLink) {
              return IconButton(
                hoverColor: const Color.fromARGB(255, 34, 68, 183),
                iconSize: 50,

                icon: const FaIcon(FontAwesomeIcons.globe),
                onPressed: followLink,


              );

            },
          ),


        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_szhkp6zk.json'),
       
            const Text(
              " ibrahim alshahrani",
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 233, 176, 140),
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
       ElevatedButton(
   
        style:ElevatedButton.styleFrom(
          primary:   const Color.fromARGB(255, 233, 176, 140), // background
          onPrimary: Colors.white, // foreground
          shadowColor: Colors.grey,
          elevation: 5,
        
          
         
            ),  
  child: const Text('contact me'),
     
        
        onPressed: () async {
         await launch('tel://+966 50 0531264');
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: '0500531264',
        );
        if (await canLaunch(launchUri.toString())) {
          await launch(launchUri.toString());
        } else {
          throw ('Could not launch $launchUri');
        }
      },
        ),
      
         const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
                style:ElevatedButton.styleFrom(
          primary:   const Color.fromARGB(255, 233, 176, 140), // background
          onPrimary: Colors.white, // foreground
          shadowColor: Colors.grey,
          elevation: 5,
        
          
         
            ),  
  child: const Text('email me'),
              onPressed: () async {
                String email = 'ibrahimalshahran96@gmail.com';
                String subject = 'subject';
                String body = '....';

                String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
      



                final Uri launchUri = Uri(
                  scheme: 'mailto',
                  path: email,
                  query: encodeQueryParameters(<String, String>{
                    'subject': subject,
                    'body': body,
                  }),
                );
                if (await canLaunch(launchUri.toString())) {
                  await launch(launchUri.toString());
                } else {
                  throw ('no email app found');
                }
                  },
                ),

            
                 
          ],
        ),
      ),
    );
     
    
   
  }
}