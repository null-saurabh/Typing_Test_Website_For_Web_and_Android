import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import '../../screens/ranking_page.dart';

class RankingDialog extends StatelessWidget {
  final int testId;
  const RankingDialog({required this.testId, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // adjust as needed
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,  // Adjust as needed
        height: MediaQuery.of(context).size.height * 0.85, // Adjust as needed
        child: Consumer<ApiProvider>(
          builder: (ctx, apiProvider, _) {
            return FutureBuilder<List<ResultData>>(
              future: apiProvider.fetchOneResult(testId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No ranking data available.');
                } else {
                  return RankingScreen(testId: testId,resultData: snapshot.data![0],popup:true,);
                }
              },
            );
          },
        ),  // Your current ResultScreen content
      ),
    );
  }
}