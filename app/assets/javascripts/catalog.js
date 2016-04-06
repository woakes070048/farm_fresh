
angular.module("Catalog", ["ngResource"])

  .factory("Category", function($resource) {
    return $resource("/categories.json/:id");
  })

  .factory("Item", function($resource) {
    return $resource("/items.json/:id");
  })

  .controller("CategoriesCtrl", ["$rootScope", "$scope", "Category",function($rootScope, $scope, Category) {

    $scope.getCategories = function(parent_id = null) {

      if (parent_id == null) {
        $scope.atTopLevel = true
      }
      else {
        $scope.atTopLevel = false;
        $rootScope.currentCategory = parent_id;
        console.log($rootScope.currentCategory);
      }

      var categories = Category.query({parent_id: parent_id}, function () {
        $scope.categories = categories;
      });
    };

    $scope.getCategories(); // load top level categories first
  }])

  .controller("ItemsCtrl", function($rootScope, $scope, Item) {

  });