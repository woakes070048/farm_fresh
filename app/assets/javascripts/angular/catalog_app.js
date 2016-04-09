
var app = angular.module("Catalog", ["ngResource", "ngAnimate"])

  .factory("Category", ["$resource", function($resource) {
    return $resource("/categories.json/:id");
  }])

  .factory("Item", ["$resource", function($resource) {
    return $resource("/items.json/:id");
  }])

  .factory("BasketItem", ["$resource", function($resource) {
    return $resource("/baskets.json/:id")
  }]);

app.config([
  "$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);



  // .controller("ItemsCtrl", ["$scope", "Item", function($scope, Item) {

  // }]);