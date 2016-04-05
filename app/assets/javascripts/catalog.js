
angular.module("Catalog", ["ngResource"])

  .factory("Category", function($resource) {
    return $resource("/categories/:id.json");
  })

  .factory("Item", function($resource) {
    return $resource("/items/:id.json");
  })

  .controller("CategoriesCtrl", function($scope, Category, Item) {

    var categories = Category.query(function() {
      $scope.categories = categories;
      console.log($scope.categories);
    });

  })

  .controller("ItemsCtrl", function($scope) {

  });