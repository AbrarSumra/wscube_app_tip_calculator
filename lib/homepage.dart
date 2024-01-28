import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var splitTotal = 1;
  num totalBill = 0;
  num totalTip = 0;
  num totalPerson = 0;
  num yourBill = 0;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      "assets/images/magician_hat.png",
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Mr ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "TIP",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Text(
                        "Calculator",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  height: 180,
                  width: 320,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Total p/Person",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.money_dollar,
                            size: 30,
                          ),
                          Text(
                            "${double.parse(((yourBill + totalTip) / splitTotal).toStringAsFixed(2))}",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text("Total bill"),
                                Row(
                                  children: [
                                    const Text(
                                      "\$",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03c9be),
                                      ),
                                    ),
                                    Text(
                                      "${yourBill + totalTip}",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03c9be),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Text("Total tip"),
                                Row(
                                  children: [
                                    const Text(
                                      "\$",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03c9be),
                                      ),
                                    ),
                                    Text(
                                      "$totalTip",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff03c9be),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("your bill"),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: _textEditingController,
                          onChanged: (text) {
                            setState(() {
                              yourBill = int.parse(text);
                            });
                          },
                          decoration: const InputDecoration(
                            icon: Icon(
                              CupertinoIcons.money_dollar,
                              size: 35,
                            ),
                            iconColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Choose",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("your tip"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                totalTip = double.parse(
                                    (yourBill * (10 / 100)).toStringAsFixed(2));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff03c9be),
                              padding: const EdgeInsets.all(8),
                            ),
                            child: const Text(
                              "10%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                totalTip = double.parse(
                                    (yourBill * (15 / 100)).toStringAsFixed(2));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff03c9be),
                              padding: const EdgeInsets.all(8),
                            ),
                            child: const Text(
                              "15%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                totalTip = double.parse(
                                    (yourBill * (20 / 100)).toStringAsFixed(2));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff03c9be),
                              padding: const EdgeInsets.all(8),
                            ),
                            child: const Text(
                              "20%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff03c9be),
                          padding: const EdgeInsets.only(left: 70, right: 70),
                        ),
                        child: const Text(
                          "Custom tip",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Split",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("the total"),
                    ],
                  ),
                  const SizedBox(width: 37),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff03c9be),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (splitTotal > 1) {
                                    splitTotal--;
                                  }
                                });
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 40,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "$splitTotal",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff03c9be),
                              ),
                              onPressed: () {
                                setState(() {
                                  splitTotal++;
                                });
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
