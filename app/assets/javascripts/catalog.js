
angular.module("Catalog", ["ngResource"])

  .factory("Category", function($resource) {
    return $resource("/categories.json/:id");
  })

  .factory("Item", function($resource) {
    return $resource("/items.json/:id");
  })

  .controller("CategoriesCtrl", function($scope, Category, Item) {

    $scope.getCategories = function(parent_id = null) {
      parent_id == null ? $scope.atTopLevel = true : $scope.atTopLevel = false;

      var categories = Category.query({parent_id: parent_id}, function () {
        $scope.categories = categories;
      });
    };

    $scope.getCategories(); // load top level categories first
  })

  .controller("ItemsCtrl", function($scope) {

  });