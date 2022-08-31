import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  //
  PageController scrollController = new PageController();
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  int _currentIndex = 0;
  void setPageTitle(String title) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(label: title));
  }

  createScrollController(String routeName) {
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));

    this.scrollController.addListener(() {
      // setPageTitle(_pages[getPageIndex(routeName)]);
      final pageIndex = (this.scrollController.page ?? 0).toInt();
      // final pageIndex = (this.scrollController.page ?? 0).round();

      if (_currentIndex != pageIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        html.document.title = _pages[pageIndex];
        // setPageTitle(_pages[pageIndex]);

        _currentIndex = pageIndex;
      }

      // this.scrollController =
      //     new PageController(initialPage: getPageIndex('$pageIndex'));
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    // final routeName = _pages[index];

    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
