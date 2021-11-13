import 'package:flutter_redux_template/actions/navigation_actions.dart';
import 'package:flutter_redux_template/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
   call(Store<AppState> store, action, NextDispatcher next) {
     if (action is NavigateToAction) {
       Routemaster.of(action.context).push(action.path);
     }

     next(action);
   }
 }