import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/ranking_modal.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/total_rank_list_tile.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/user_rank_list_tile.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class ListViewContainer extends StatelessWidget {
  final int testId;
  const ListViewContainer({
    required this.testId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    final scrollController1 = ScrollController();

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 5, top: 25, bottom: 25),
        child: Consumer<ApiProvider>(
          builder: (ctx, apiProvider, _) {
            return FutureBuilder<List<RankingData>>(
              future: apiProvider
                  .fetchRanking(testId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else
                  if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No ranking data available.');
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserRankListTile(data: snapshot.data![0]),
                      const SizedBox(height: 29),
                      Expanded(
                        child: Scrollbar(
                          controller: scrollController1,
                          interactive: false,
                          thumbVisibility: true,
                          child: ListView.builder(
                            controller: scrollController1,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TotalRankingListTile(
                                  index: index, data: snapshot.data![index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 5, top: 25, bottom: 25),
        child: Consumer<ApiProvider>(
          builder: (ctx, apiProvider, _) {
            return FutureBuilder<List<RankingData>>(
              future: apiProvider
                  .fetchRanking(testId), // Call your API method here
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // API call is still in progress
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // API call resulted in an error
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  // API call completed, but no data returned
                  return const Text('No ranking data available.');
                } else {
                  // API call completed successfully, render the data
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserRankListTile(data: snapshot.data![0]),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true, // Important to prevent the nested ListView from taking full height
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return TotalRankingListTile(
                              index: index, data: snapshot.data![index]);
                        },
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
