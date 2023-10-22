import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/instruction_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/result_screen.dart';

class LiveTestListTile extends StatefulWidget {
  final String status;
  final int index;
  const LiveTestListTile(
      {required this.status, required this.index, super.key});

  @override
  State<LiveTestListTile> createState() => _LiveTestListTileState();
}

class _LiveTestListTileState extends State<LiveTestListTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: widget.status == "Started"
        ?(){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const InstructionPage(),
            ),
          );
        }
        :null,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: _isHovering
              ?const Border(
                left: BorderSide(
                  color: Color(0xff369CBC),
                  width: 3.5,
                ),
                bottom: BorderSide(
                  color: Color(0xff369CBC),
                  width: 1.0,
                ),
                right:
                BorderSide(
                  color: Color(0xff369CBC),
                  width: 1.0,
                ),
                top: BorderSide(
                  color: Color(0xff369CBC),
                  // width: 1.0,
                ),
              )
                  : const Border(
                left: BorderSide(
                  color: Color(0xff369CBC),
                  width: 3.5,
                ),
                right: BorderSide(
                  color: Color(0xff369CBC),
                    width: 0

                ),
                top: BorderSide(
                  color: Color(0xff369CBC),
                    width: 0

                ),
                bottom: BorderSide(
                  color: Color(0xff369CBC),
                  width: 0
                ),
              )
            ),
            child: ListTile(
              title: Text(
                "SSC Typing Test - Grade A - ${widget.index}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: IntrinsicHeight(
                child: Row(
                  children: [
                    rowItem("assets/images/ranking.png", "90 Key Strokes"),
                    requiredVerticalDivider(),
                    rowItem("assets/images/question.png", "English"),
                    requiredVerticalDivider(),
                    rowItem("assets/images/timer.png", "30 mins"),
                  ],
                ),
              ),
              trailing: widget.status == "Completed"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        leaderBoardButton(context),
                        const SizedBox(
                          width: 10,
                        ),
                        opaqueButton(
                          context,
                          "View Result",
                          () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ResultScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : widget.status == "Started"
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Ends In :",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              "12h : 34m : 45s",
                              style: TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffE72A2A)),
                            ),
                          ],
                        )
                      : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lock_open_outlined,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Start In :",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              "12h : 34m : 45s",
                              style: TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }

  Widget requiredVerticalDivider() {
    return SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
        thickness: 1.2,
      ),
    );
  }

  Widget rowItem(String image, String text) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff929292)),
        )
      ],
    );
  }

  Widget leaderBoardButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () async {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RankingScreen()));
      },
      child: const Icon(Icons.leaderboard_outlined, color: Color(0xff369CBC)),
    );
  }

  Widget opaqueButton(
    BuildContext context,
    String name,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: onTap,

      //     () async {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => const InstructionPage(),
      //     ),
      //   );
      // },
      child: Text(
        name,
        style: const TextStyle(color: Color(0xff369CBC)),
      ),
    );
  }
}
