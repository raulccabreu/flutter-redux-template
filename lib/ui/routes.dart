import 'package:flutter_redux_template/ui/pages/foo_page.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: FooPage()),
  },
);