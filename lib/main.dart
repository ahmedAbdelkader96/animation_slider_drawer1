import 'package:flutter/material.dart';

void main() {
  runApp( MyApp1());
}








class MyApp1 extends StatefulWidget {
  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    );
  }
}


class MyApp2 extends StatefulWidget {
  const MyApp2({Key key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> with SingleTickerProviderStateMixin{
  AnimationController controller ;
  Animation<double> tween;
  double xOffset = 0;

  double yOffset = 0;

  bool isDrawerOpen = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this , duration: Duration(milliseconds: 300));
    tween = Tween<double>(begin: 0.0, end: 24.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addListener(() {
      setState(() {});});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: <Widget> [
          DrawerScreen(),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0)
              {
                setState(() {
                  controller.forward();
                  xOffset = 290;
                  yOffset = 80;
                  isDrawerOpen = true;
                });
                print("Dragging in +X direction");
              }
              else {
                setState(() {
                  controller.reverse();
                  xOffset = 0;
                  yOffset = 0;
                  isDrawerOpen = false;
                });
                print("Dragging in -X direction");
              }
            },
            child: AnimatedContainer(
              padding: EdgeInsets.only(bottom: 4),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(isDrawerOpen ? 0.85 : 1.00)
                ..rotateZ(isDrawerOpen ? -50 : 0),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(tween.value ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0,left: 0,right: 0),
                    child: AnimatedContainer(
                      height: isDrawerOpen == true?  60:80 ,
                      //width: MediaQuery.of(context).size.width,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.65),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(tween.value),topLeft: Radius.circular(tween.value) ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 7,),
                            isDrawerOpen
                                ? IconButton(onPressed: (){setState(() {
                              controller.reverse();
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });}, icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 28,)  )
                                : IconButton(onPressed: (){setState(() {
                              controller.forward();
                              xOffset = 290;
                              yOffset = 80;
                              isDrawerOpen = true;
                            });}, icon:Icon(Icons.menu,color: Colors.white,size: 28,)),
                            Expanded(
                              child: const Text(
                                'Animation Drawer',
                                textAlign: TextAlign.center,style: TextStyle(fontSize: 21,color: Colors.white,fontWeight:FontWeight.w500 ),

                              ),
                            ),
                            SizedBox(width: 30,)
                          ],
                        ),
                      ),
                    ),
                  )
                  ,
                  Expanded(

                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),

                      // mainAxisAlignment: Mai,
                      children: <Widget>[

                        //SizedBox(height: 15),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NewPadd("assets/second.jpeg","ahmed") ,
                            NewPadd("assets/second.jpeg","ahmed") ,
                          ],
                        ),
                        SizedBox(height: 13,),




                      ],

                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}





class DrawerScreen extends StatefulWidget {

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.purple.withOpacity(0.65) ,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 25,
            ),              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage('assets/second.jpeg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Awesome Slider',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[
                    NewRow(
                      text: 'Categories',
                      icon: Icons.category_outlined,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NewRow(
                      text: 'Notifications',
                      icon: Icons.add_alert_outlined,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NewRow(
                      text: 'Messages',
                      icon: Icons.chat_bubble_outline,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NewRow(
                      text: 'Inbox',
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NewRow(
                      text: 'Favorites',
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),




              ],
            ),
          ),
          ),
          Positioned(bottom: MediaQuery.of(context).size.height*0.2,left: 20,child: Row(
            children: [
              Icon(Icons.nightlight_round,color: Colors.black54),
              Switch(value: true, onChanged: (bool){} ,activeColor: Colors.purple,),
              Icon(Icons.lightbulb_outline,color: Colors.white,),

            ],
          ),)
        ],
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

   NewRow({
     this.icon,
     this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white,fontSize: 17),
        )
      ],
    );
  }
}



class NewPadd extends StatelessWidget {
  const NewPadd(this.image , this.text );
 final String image ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
                image: DecorationImage(image: AssetImage(image))
            ),

        ),
        SizedBox(height: 6,),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}
