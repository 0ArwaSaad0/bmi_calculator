import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int weigth = 60;
  int age = 20;
  double height = 120;
  bool? is_male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 11, right: 11, bottom: 11),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      is_male = true;
                      setState(() {});
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: is_male == true ? Colors.blue : Colors.grey),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/male.png',
                              height: 100,
                              width: 100,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      is_male = false;
                      setState(() {});
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: is_male == true ? Colors.grey : Colors.blue),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/female.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style: Theme.of(context).textTheme.headline1,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Height',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${height.round()}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'cm',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                Slider(
                    value: height,
                    max: 250,
                    min: 100,
                    onChanged: (newValue) {
                      print(newValue.round());
                      setState(() {
                        height = newValue;
                      });
                    })
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Weight',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            '$weigth',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  weigth++;
                                  setState(() {});
                                },
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    weigth++;
                                    setState(() {});
                                  },
                                ),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  setState(() {});
                                },
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    weigth--;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Age',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            '$age',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    age++;
                                    setState(() {});
                                  },
                                ),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  age--;
                                  setState(() {});
                                },
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    age--;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text(
              'Calculate',
              style: Theme.of(context).textTheme.headline1,
            ),
            onPressed: () {
              result();
              print(result());
              setState(() {});
            },
          ),
          Expanded(
            child: Container(
              width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Result is ${result()}  \n Gender is ${is_male==true? "Male":"Female"}',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),),
          )
        ],
      ),
    );
  }

  int result() {
    double result = weigth / pow(height / 100, 2);
    return result.round();
  }
}
