import 'package:flutter/material.dart';

class Disease extends StatefulWidget {
  const Disease({ Key? key }) : super(key: key);

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      title: Text("   Music Therapy"),
      automaticallyImplyLeading: false,

      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

              Padding(
               padding: const EdgeInsets.all(15.0),
               child: Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                    
                    color: Color.fromARGB(255, 65, 129, 48),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      
                      child: Container(
                        
                      
                        padding: EdgeInsets.all(20),
                        child: Row(
                          
                          children: [
                            Image.asset(
                              "assets/stress.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                                      
                              SizedBox(width: 20,),
                              Text("Stress",style: TextStyle(fontSize: 28, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),


                  
             ),



              Padding(
               padding: const EdgeInsets.all(15.0),
               child: Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                    
                    color: Color.fromARGB(255, 73, 47, 167),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      
                      child: Container(
                        
                      
                        padding: EdgeInsets.all(20),
                        child: Row(
                          
                          children: [
                            Image.asset(
                              "assets/bloodpressure.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                                      
                              SizedBox(width: 20,),
                              Text("Blood Pressure",style: TextStyle(fontSize: 28, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),


                  
             ),


             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                    
                    color: Color.fromARGB(255, 65, 65, 65),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      
                      child: Container(
                        
                      
                        padding: EdgeInsets.all(20),
                        child: Row(
                          
                          children: [
                            Image.asset(
                              "assets/insomnia.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                                      
                              SizedBox(width: 20,),
                              Text("Insomnia",style: TextStyle(fontSize: 28, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),


                  
             ),
            
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                    
                    color: Color.fromARGB(255, 219, 122, 155),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      
                      child: Container(
                        
                      
                        padding: EdgeInsets.all(20),
                        child: Row(
                          
                          children: [
                            Image.asset(
                              "assets/pregnancy.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                                      
                              SizedBox(width: 20,),
                              Text("Pregnancy",style: TextStyle(fontSize: 28, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),


                  
             ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Material(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  
                    
                    color: Color.fromARGB(255, 253, 120, 31),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      
                      child: Container(
                        
                      
                        padding: EdgeInsets.all(20),
                        child: Row(
                          
                          children: [
                            Image.asset(
                              "assets/concentration.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                                      
                              SizedBox(width: 20,),
                              Text("Concentration",style: TextStyle(fontSize: 28, color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),


                  
             ),

        
            
          ],
        ),
        
      ),
      
    );
  }
}