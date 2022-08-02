import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak/provider/tiktakprovider.dart';

class HomePage extends StatelessWidget {
  late TikTakProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<TikTakProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text(
          "TikTak",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<TikTakProvider>(
        builder: (BuildContext context, value, Widget? child) => Column(
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5, 5),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Score Board",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Player0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            value.player1.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "PlayerX",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            value.player2.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () {
                        value.tapped(i, context);
                      },
                      child: Container(
                        color: Colors.red[200],
                        alignment: Alignment.center,
                        child: Text(
                          value.displayText[i],
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, -5),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TIKTAKTOE",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "@CREATEDBYBRIJ",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
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
