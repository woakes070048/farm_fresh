
var app = angular.module("Catalog", ["ngResource"])

  .factory("Category", ["$resource", function($resource) {
    return $resource("/categories.json/:id");
  }])

  .factory("Item", ["$resource", function($resource) {
    return $resource("/items.json/:id");
  }])

  .factory("BasketItem", ["$resource", function($resource) {
    return $resource("/baskets.json/:id")
  }]);



  // .controller("ItemsCtrl", ["$scope", "Item", function($scope, Item) {

  // }]);