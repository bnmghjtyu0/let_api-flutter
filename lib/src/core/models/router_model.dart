enum RouteMethod { push, go }

/// 購物車路由 extra 型別
class CartRouteExtraModel {
  ///路由方法
  RouteMethod? routeMethod;
  CartRouteExtraModel({this.routeMethod});
}
