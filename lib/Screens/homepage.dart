import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak/provider/tiktakprovider.dart';

class HomePage extends StatelessWidget {
  late TikTakProvider provider;
  static var myNewFont=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black,letterSpacing: 3,fontSize: 15)
  );
  static var myNewFontWhite=GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white,letterSpacing: 3)
  );

  @override
  Widget build(BuildContext context) {
    provider = context.read<TikTakProvider>();
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Consumer<TikTakProvider>(
          builder: (BuildContext context, value, Widget? child) => Column(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.grey,
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
                      style: myNewFontWhite,
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
                              style: myNewFontWhite,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              value.player1.toString(),
                              style: myNewFontWhite,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "PlayerX",
                              style: myNewFontWhite,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              value.player2.toString(),
                              style: myNewFontWhite,
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
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: Colors.grey,
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
                          color: Colors.grey[700],
                          alignment: Alignment.center,
                          child: Text(
                            value.displayText[i],
                            style:myNewFontWhite,
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
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5, 5),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.grey,
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
                          style: myNewFontWhite,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "@CREATEDBYBRIJ",
                          style: myNewFontWhite,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
