import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_listtile.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class HistoryContainer extends StatelessWidget {
  final bool popup;
  const HistoryContainer({required this.popup, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    final scrollController1 = ScrollController();

    // int itemCount = 15;
    // double calculatedHeight = (66 * itemCount) + 25;
    //
    // double containerHeight =
    // (calculatedHeight < MediaQuery.of(context).size.height -100)
    //     ? calculatedHeight
    //     : MediaQuery.of(context).size.height * 0.90;
    return Container(
      // height: popup?(MediaQuery.of(context).size.height * 0.66 ) : containerHeight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 5,right: 5),
        child: Scrollbar(
          controller: scrollController1,
          interactive: false,
          thumbVisibility: true,
          child: Consumer<ApiProvider>(
            builder: (ctx, apiProvider, _) {
              return FutureBuilder<List<ResultData>>(
                future: apiProvider.fetchAllResult(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No ranking data available.');
                  } else {
                    int itemCount = snapshot.data!.length;
                    double calculatedHeight = (66 * itemCount) + 25;
                    double containerHeight =
                    (calculatedHeight < MediaQuery.of(context).size.height - 100)
                        ? calculatedHeight
                        : MediaQuery.of(context).size.height * 0.88;

                    return Container(
                      color: Colors.white,
                      height: popup ? (MediaQuery.of(context).size.height * 0.66) : containerHeight,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryListTile(popup: popup, resultData: snapshot.data![index]);
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){

    final scrollController1 = ScrollController();

    int itemCount = 15;
    double calculatedHeight = (66 * itemCount) + 25;

    double containerHeight =
    (calculatedHeight < MediaQuery.of(context).size.height -100)
        ? calculatedHeight
        : MediaQuery.of(context).size.height * 0.84;

    return Container(
      // height: popup?(MediaQuery.of(context).size.height * 0.66 ) : containerHeight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 5,right: 5),
        child: Scrollbar(
          controller: scrollController1,
          interactive: false,
          thumbVisibility: true,
          child: Consumer<ApiProvider>(
            builder: (ctx, apiProvider, _) {
              return FutureBuilder<List<ResultData>>(
                future: apiProvider.fetchAllResult(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No ranking data available.');
                  } else {
                    int itemCount = snapshot.data!.length;
                    double calculatedHeight = (66 * itemCount) + 25;
                    double containerHeight =
                    (calculatedHeight < MediaQuery.of(context).size.height -100)
                        ? calculatedHeight
                        : MediaQuery.of(context).size.height * 0.84;

                    return Container(
                      color: Colors.white,
                      height: popup ? (MediaQuery.of(context).size.height * 0.66) : containerHeight,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryListTile(popup: popup, resultData: snapshot.data![index]);
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
