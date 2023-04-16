import 'package:flutter/material.dart';


class Who extends StatefulWidget {
  @override
  State<Who> createState() => _WhoState();
}

class _WhoState extends State<Who> {
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        
        body:Center(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 130,),
              Text("Let`s get acquainted",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height:10,),
              Container(child:
               Text("Pellentsque placeant arcou in risus facilisis",style: TextStyle(),)),
        
          Text("sedrisus facilisis in risus facilisis",style: TextStyle(),),
    SizedBox(height: 70,),
          Row(
            
            children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Image.asset("images/patint.jpg",bundle: null,width: 90,),
             ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Im a Patient",style: TextStyle(color: Colors.green.shade400,fontWeight: FontWeight.bold,fontSize:20),),
                     SizedBox(height: 25,),
                   Text("proin convailis libero ace nisl "),
                ],
              )
            ],
          )
         ,
         SizedBox(height: 25,),

             Row(
                       children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Image.asset("images/doctor.jpg",width: 90,),
             ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Im a Doctor",style: TextStyle(color: Colors.green.shade400,fontWeight: FontWeight.bold,fontSize:20),),
                 SizedBox(height: 25,),
                   Text("proin convailis libero ace nisl "),
                ],
              )
                       ],
                     ),
              SizedBox(height: 50,),
           Container(
                 decoration: BoxDecoration
                 (
                   color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(20)
                 ), 
                 
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
         
        
            ],
          ),
        )
        ),
    );
  }
}
