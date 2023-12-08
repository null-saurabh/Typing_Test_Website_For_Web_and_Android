import 'package:flutter/material.dart';

class LearnMenuProvider extends ChangeNotifier {

  int _currentTestIndex = 0;

  final List<String> _testStrings = [
  'ask; dad flask; jfk salad fad lad skald sad lad; fad ask jfk; salad skald flask; sad ask dad flask; jfk salad fad lad skald flask sad lad fad ask jfk salad skald ask dad; flask jfk salad fad lad skald; sad lad fad ask jfk salad skald flask sad jfk salad; ask lad fad flask skald sad lad fad; ask jfk; salad skald flask sad; ask dad flask jfk salad; fad lad skald jfk',
  'qwer quip rope ripe queue pure pour opium poem power quiet equip erupt quire pore pique queer quip qwerty quire erupt equip quiet power poem poem opium pour pure queue ripe rope quip queer pique pore quire erupt equip quiet power poem quip poem power quiet equip erupt quire pore pique queer quip rope ripe queue pure pour opium poem power quiet equip erupt quire qwerty quip poem',
  'zxcv, xcvz, cvzx, vzc, czv, zxc, xcv, cvz, vzc, czv, zxc, xcv, cvz, vzc, czv, zxc, xcv, cvz, vzc, czv, zxc, xcv, cvz, vzc, czv, zxc, xcv zxcvbnm, mnbvcxz, zxcvbnm. mnbvcxz. zxcvbnm mnbvcxz zxcvbnm, . mnbvcxz zxcvbnm mnbvcxz. zxcvbnm, mnbvcxz, zxcvbnm, mnbvcxz,. zxcvbnm,. mnbvcxz, zxcvbnm mnbvcxz zxcvbnm mnbvcxz zxcvbnm mnbvcxz. zxcvbnm, mnbvcxz, zxcvbnm, mnbvcxz, ',
  'tyg hbn by nthyng bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg bynhnt ythnthg hbtngh thbgty thg bhyn bnyg hth thg',
    "a, s, d, f, q, w, e, r, j, k, l, ‘;’, u, i, o and p",
    "a, s, d, f, J, K, L and ‘;’",
    "q, w, e, r, U, I, O and P",
    "z, x, c, v, M, ‘,’ and ‘.’",
    "t, y, g, h, B and N",
    "c, v, b, n, m, ‘,’, ‘.’, ‘/’, G, H, J and K",
    "q, w, e, r, t, y, u, i, o, p, ‘[’ and ‘]’",
    'A, S, D, F, G, H, J, K, L, ‘;’, ‘’’ and ‘\\’',
    "Z, X, C, V, B, N, M, ‘,’, ‘.’, ‘/’ and ‘?’",
    "Q, A, Z, W, S, X, E, D, C, R, F and V",
    "t, g, b, y, h, n, U, J, M, I, K and ‘,’",
    '''o, l, ‘.’, p, ‘;’, ‘/’, ‘[’, ‘]’, ‘\\’, ‘’’ and ‘"’ ''',
    "e, d, c, r, f, v, T, G, B, Y, H and N",
    "u, j, m, i, k, ‘,’, O, L, ‘.’, P, ';' and ‘/’",
    "A, z, Q, s, X, W, d, c, E, f, V and r",
    "n, M, ‘,’, ‘.’, ‘/’, B, v, c, X, z and ‘?’",
    '''H, j, k, l, ‘;’, ‘’’ and ‘"’, G, f, d, S, a and ‘\\’ ''',
    "Y, u, i, O, p, ‘[’, ‘]’, t, R, e, W and q",
    '''K, l, ‘;’, ‘’’ and ‘"’, J, h, g, F, d and S''',
    "'`', 1, 2, 3, 4, q, w, e and r",
    "5, 6, t, y, g, h, b and n",
    "7, 8, u, i, j, k, m and ','",
    "9, 0, o, p, '[', ']', 'l' and ';'",
    "'`', 1, 2, 3, 4, a, s, d and f",
    "5, 6, g, h, j, k, l and ';'",
    "7, 8, z, x, c, v, b and n",
    "9, 0, m, ',', '.', '/', '?', and '`'",
  ];

  String get currentTestString => _testStrings[_currentTestIndex];

  void setTestIndex(int index) {
    _currentTestIndex = index;
    notifyListeners();
  }

  void goToNextTest() {
    if (_currentTestIndex == _testStrings.length - 1) {
      _currentTestIndex = 0;
    } else {
      _currentTestIndex++;
    }
    notifyListeners();
  }
}
