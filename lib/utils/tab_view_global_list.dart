import 'package:flutter/cupertino.dart';

import '../adaptive/call_details.dart';
import '../adaptive/call_details_add_adaptive.dart';
import '../adaptive/chats_details.dart';
import '../adaptive/profile_theme_change_adapative.dart';

List<Widget> tabList = const [
  CallDetailsAddScreenAdapatiev(),
  ChatsDetailsAdaptive(),
  CallDetails(),
  ProfileThemecChangeaAdapative(),
];

List<BottomNavigationBarItem> tabItemList = [
  const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.person_badge_plus),
  ),
  const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.chat_bubble,
        size: 25,
      ),
      label: 'CHATS'),
  const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.phone,
        size: 25,
      ),
      label: 'CALLS'),
  const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings), label: 'SETTINGS'),
];