import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view/screens/result_screen.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class ResultDialog extends StatelessWidget {
  final int testId;
  const ResultDialog({
    required this.testId,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),

        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,  // Adjust as needed
          height: MediaQuery.of(context).size.height * 0.95, // Adjust as needed
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
                    return ResultScreen(result: snapshot.data![0],);
                  }
                },
              );
            },
          ),  // Your current ResultScreen content
        ),
      ),
    );
  }
}
