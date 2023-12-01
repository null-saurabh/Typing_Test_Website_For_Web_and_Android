import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigationProvider extends ChangeNotifier {

  // NavigationService(this.router);

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentPage = '/home';

  String get currentPage => _currentPage;

  List<String> _originalLocations = ['/home','/home'];

  List<String> get originalLocations => _originalLocations;

  void addOriginalLocation(String location) {
    _originalLocations.add(location);
  }

  void updateCurrentPage(String routeName) {
    _currentPage = routeName;
    notifyListeners();
  }
  void updateCurrentPageFromUrl(String routeName) {
    _currentPage = routeName;
    notifyListeners();
  }

  // Future<void> navigateToRankingPage(BuildContext context, int testId) async {
  //   _currentPage = 'ranking';
  //   notifyListeners();
  //   final router = locator<FluroRouter>();
  //   router.navigateTo(context, '/ranking/$testId', transition:null);
  // }
  //
  // Future<void> navigateToExamPage(BuildContext context, String examName) async {
  //   _currentPage = 'exam';
  //   notifyListeners();
  //   final router = locator<FluroRouter>();
  //   router.navigateTo(context, '/exam/$examName', transition: null);
  // }



  // void goBack(){
  //   return navigatorKey.currentState!.pop();
  // }

}

