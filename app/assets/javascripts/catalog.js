
angular.module("Catalog", ["ngResource"])

  .factory("Category", function($resource) {
    return $resource("/categories.json/:id");
  })

  .factory("Item", function($resource) {
    return $resource("/items.json/:id");
  })

  .controller("CategoriesCtrl", function($scope, Category, Item) {

    $scope.getCategories = function(parent_id) {
      var categories = Category.query({parent_id: parent_id}, function () {
        $scope.categories = categories;
        console.log(categories)
      });
    };

    $scope.getCategories();
  })

  .controller("ItemsCtrl", function($scope) {

  });