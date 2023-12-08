import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigationProvider extends ChangeNotifier {

  // NavigationService(this.router);

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentPage = '/home';

  String get currentPage => _currentPage;

  final List<String> _originalLocations = ['/home','/home'];

  List<String> get originalLocations => _originalLocations;

  String _pageTitle = "All Tests";

  String get pageTitle => _pageTitle;

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

  void updateTitle(String title){
    _pageTitle = title;
    notifyListeners();
  }

}

