

  app.controller("CategoriesCtrl", ["$rootScope", "$scope", "Category", "Item", function($rootScope, $scope, Category, Item) {
    $scope.sortList = ["Price", "Quantity", "Distance"];

    $scope.getCategories = function(parent_id, parent) {
      if (parent != null) {
        $scope.items = parent.items;
      }

      if (parent_id == null) {
        $scope.atTopLevel = true
        $scope.currentCategory = null;
      }
      else {
        $scope.atTopLevel = false;
        $scope.currentCategory = parent_id;
        $rootScope.currentCategory = parent;
      }

      var categories = Category.query({parent_id: parent_id}, function () {
        $scope.categories = categories;
        console.log($scope.categories);
      });
    };

    $scope.getCategories(); // load top level categories first

    $scope.setItems = function(category) {
      $scope.items = category.items;
      $rootScope.items = category.items;
    }

    $scope.setSortOption = function() {
      if ($scope.currentCategory != null) {
        var sortedItems = Item.query( {sort_option: $scope.selectedSort,
                                       category_id: $scope.currentCategory},
          function() { $scope.items = sortedItems; })
      }
    }

  }]);