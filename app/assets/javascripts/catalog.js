
angular.module("Catalog", ["ngResource"])

  .factory("Category", ["$resource", function($resource) {
    return $resource("/categories.json/:id");
  }])

  .factory("Item", ["$resource", function($resource) {
    return $resource("/items.json/:id");
  }])

  .controller("CategoriesCtrl", ["$scope", "Category", "Item", function($scope, Category, Item) {
    $scope.sortList = ["Price", "Quantity", "Distance"];

    $scope.getCategories = function(parent_id = null, parent) {
      if (parent != null)
        $scope.items = parent.items;

      // debugger;
      if (parent_id == null) {
        $scope.atTopLevel = true
        $scope.currentCategory = null;
      }
      else {
        $scope.atTopLevel = false;
        $scope.currentCategory = parent_id;
        // $scope.items = parent_id.items;
      }

      var categories = Category.query({parent_id: parent_id}, function () {
        $scope.categories = categories;
      });
    };

    $scope.getCategories(); // load top level categories first

    $scope.setItems = function(category) {
      $scope.items = category.items;
    }

    $scope.setSortOption = function() {
      // TODO: Sort by items
    }

  }])

  .controller("ItemsCtrl", ["$scope", "Item", function($scope, Item) {

  }]);