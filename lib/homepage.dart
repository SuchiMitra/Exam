import 'package:flutter/material.dart';
class BoxContainer extends StatelessWidget {
  final Widget? content;
  Function? tapcontent;
  final Color colors;
  BoxContainer({required this.colors, this.content, this.tapcontent});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colors,
        ),
        child: content);
  }
}

class Subarna extends StatefulWidget {
  @override
  State<Subarna> createState() => _SubarnaState();
}

class _SubarnaState extends State<Subarna> {
  double slidervalue = 0;
  double floatvalue = 0;

  var activeClick = Colors.blue;
  var deactiveClick = Colors.teal;
  var click1 = Colors.teal;
  var click2 = Colors.teal;
  void click(int c) {
    if (c == 1) {
      if (click1 == deactiveClick) {
        click1 = activeClick;
        click2 = deactiveClick;
      } else if (click1 == activeClick) {
        click1 = deactiveClick;
      }
    } else if (c == 2) {
      if (click2 == deactiveClick) {
        click2 = activeClick;
        click1 = deactiveClick;
      } else if (click2 == activeClick) {
        click2 = deactiveClick;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Exam'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: BoxContainer(
                colors: Colors.teal,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${slidervalue.round()}',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Slider(
                        value: slidervalue,
                        max: 200,
                        onChanged: (double newvalue) {
                          setState(() {
                            slidervalue = newvalue;
                          });
                        }),
                  ],
                ),
              ))
            ],
          )),
          Expanded(
              child: Row(
            
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      click(1);
                    });
                  },
                  child: BoxContainer(
                    colors: click1,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        Icon(Icons.android,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      click(2);
                    });
                  },
                  child: BoxContainer(
                    colors: click2,
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.animation)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
              child: BoxContainer(
            colors: Colors.teal,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      floatvalue--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '${floatvalue.round()}',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      floatvalue++;
                    });
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

