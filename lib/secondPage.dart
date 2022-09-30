import 'dart:math';

import 'package:flutter/material.dart';
import 'package:malumotlar_tuzilmasi_va_algoritm_1/user.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  PageController controller = PageController();
  TextEditingController? textEditingControllersearch;
  TextEditingController? textEditingControllersurename;
  TextEditingController? textEditingControllername;
  TextEditingController? textEditingControllerold;
  TextEditingController? textEditingControllerball;


  Color showColor() {
    Color rang = Colors.white;
    Random random = Random();
    int score = random.nextInt(10);
    switch (score) {
      case 0:
        {
          rang = Colors.lime;
          break;
        }
      case 1:
        {
          rang = Colors.orange;
          break;
        }
      case 2:
        {
          rang = Colors.deepOrange;
          break;
        }
      case 3:
        {
          rang = Colors.pinkAccent;
          break;
        }
      case 4:
        {
          rang = Colors.lime;
          break;
        }
      case 5:
        {
          rang = Colors.deepPurple;
          break;
        }
      case 6:
        {
          rang = Colors.purple;
          break;
        }
      case 7:
        {
          rang = Colors.pink;
          break;
        }
      case 8:
        {
          rang = Colors.red;
          break;
        }
      case 9:
        {
          rang = Colors.green;
          break;
        }
      case 10:
        {
          rang = Colors.yellow;
          break;
        }
    }
    return rang;
  }
  List<User> studentsList = [
    User(name: 'Shahbozbek', surename: 'Tojaliyev', old: '18', ball: '180'),
    User(name: 'Davron', surename: 'Qosimov', old: '20', ball: '29'),
    User(name: 'Halim', surename: 'Koklamov', old: '23', ball: '90'),
    User(name: 'Salim', surename: 'Salimov', old: '13', ball: '89'),
    User(name: 'Kamol', surename: 'Hojiakbarov', old: '14', ball: '83'),
    User(name: 'Qosim', surename: 'Haydarov', old: '20', ball: '34'),
    User(name: 'Hoshim', surename: 'Parpiyev', old: '18', ball: '43'),
  ];
  
  @override
  void initState() {
    textEditingControllername = TextEditingController();
    textEditingControllersurename = TextEditingController();
    textEditingControllerold = TextEditingController();
    textEditingControllerball = TextEditingController();
    textEditingControllersearch = TextEditingController();
    setState(() {
      showColor();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      PageView(
        controller: controller,
        children: [
          SafeArea(
            child:
            Scaffold(
              backgroundColor: Color(0xFF121212),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
              floatingActionButton: SizedBox(
                height: MediaQuery.of(context).size.height*0.09,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingControllersearch,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Color(0xFF272727),
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Color(0xFF9E9E9E),fontSize: 20),
                        prefix:
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 50,
                            child: MaterialButton(
                              elevation: 1,
                              onPressed: (){
                                String search = textEditingControllersearch!.text.toString();
                                bool evrika = false;
                                int index = 0;
                                for(int i=0; i<studentsList.length; i++){
                                  if(studentsList[i].name==search){
                                    evrika = true;
                                    index = i;
                                    break;
                                  }
                                }
                                if(evrika){
                                  showDialog(context: context, builder: (_){
                                    return AlertDialog(
                                      title: Text('DevShoh', style: TextStyle(color: Colors.black),),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text('Topildi!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300),),
                                            Text('Name : ${studentsList[index].name}', style: TextStyle(color: Colors.black),),
                                            Text('Surename : ${studentsList[index].surename}', style: TextStyle(color: Colors.black),),
                                            Text('Old : ${studentsList[index].old}', style: TextStyle(color: Colors.black),),
                                            Text('Ball : ${studentsList[index].ball}', style: TextStyle(color: Colors.black),),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text('Ok', style: TextStyle(
                                          color: Colors.black,
                                        ),))
                                      ],
                                    );
                                  });
                                }else{
                                  showDialog(context: context, builder: (_){
                                    return AlertDialog(
                                      title: Text('DevShoh', style: TextStyle(color: Colors.black),),
                                      content: const Text('Afsuski topilmadi.', style: TextStyle(color: Colors.black),),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text('Ok', style: TextStyle(
                                          color: Colors.black,
                                        ),))
                                      ],
                                    );
                                  });
                                }
                                setState(() {
                                  textEditingControllersearch!.text = '';
                                });
                              }, child: Icon(Icons.search, color: Color(0xFF9E9E9E), size: 25,),),
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),

                      )
                  ),
                ),
              ),
              body: ListView.builder(
                  itemCount: studentsList.length,
                  itemBuilder: (BuildContext context, index) {
                    double pad = 10;
                    if(index==0){
                      pad = 70;
                    }
                    return Padding(
                      padding:  EdgeInsets.only(top: pad, left: 8, right: 10,),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF434343),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: CircleAvatar(
                                backgroundColor: showColor(),
                                child:  Text('${studentsList[index].name![0]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                child: Text('Surename : ${studentsList[index].surename}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                child: Text('Name : ${studentsList[index].name}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Container(
                                child: Text('Old : ${studentsList[index].old}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0, bottom: 5),
                              child: Container(
                                child: Text('Ball : ${studentsList[index].ball}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          SafeArea(
            child:
            Scaffold(

              backgroundColor: Color(0xFF121212),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingControllersurename,
                        style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Color(0xFF272727),
                            filled: true,
                            hintText: 'Surename',
                            hintStyle: TextStyle(color: Color(0xFF9E9E9E),fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingControllername,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF272727),
                          filled: true,
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Color(0xFF9E9E9E),fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingControllerold,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF272727),
                          filled: true,
                          hintText: 'Old',
                          hintStyle: TextStyle(color: Color(0xFF9E9E9E),fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingControllerball,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF272727),
                          filled: true,
                          hintText: 'Ball',
                          hintStyle: TextStyle(color: Color(0xFF9E9E9E),fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: (){
                          String name = '', surename = '', old = '', ball = '';
                             name = textEditingControllername!.text.toString();
                             surename = textEditingControllersurename!.text.toString();
                             old = textEditingControllerold!.text.toString();
                             ball = textEditingControllerball!.text.toString();
                          print('                                          ');
                          print(name);
                          if(name.isEmpty || surename.isEmpty || old.isEmpty || ball.isEmpty){
                            showDialog(context: context, builder: (_){
                              return AlertDialog(
                                title: Text('DevShoh', style: TextStyle(color: Colors.black),),
                                content: Text("Ma`lumotlarni oxirgacha to`ldiring!",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                                actions: [
                                       TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text('Ok', style: TextStyle(color: Colors.red),)),
                                ],
                              );
                            });
                          }else{
                            User user = User(surename: surename, name: name, old: old, ball: ball);
                            setState(() {
                               textEditingControllerold!.text = '';
                               textEditingControllersurename!.text = '';
                               textEditingControllername!.text = '';
                               textEditingControllerball!.text = '';
                               studentsList.add(user);
                            });
                          }
                        },
                        child: Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                      ),
                    )
                  ],

                ),
              )
            ),
          ),
        ],

      );
  }
}
