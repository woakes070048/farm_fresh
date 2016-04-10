
app.controller("BasketsCtrl", ["$scope", "BasketItem", "$http", function($scope, BasketItem, $http) {

  $scope.addToBasket = function(item_id) {
    if($scope.item_quantity == null || $scope.item_quantity < 1) {
      return;
    }

    BasketItem.save({
      basket_item: {
        item_id: item_id,
        quantity: $scope.item_quantity
      }
    }, function(response) {
      $scope.getBasketCount();
      shakeBasket();
      showItemAddedNotification();
    });
  };

  $scope.getBasketCount = function() {
    $http.get("/baskets/count")
      .then(function(response) {
        $scope.basket_count = response.data.count;
        $("#basketCount").html(response.data.count);
      });
  }

  $scope.getBasketItems = function() {
    var basket_items = BasketItem.query({}, function(response) {
      $scope.basket_items = basket_items;
      for(var i = 0; i < $scope.basket_items.length; ++i){
        var item = $scope.basket_items[i];
        item.total = (item.quantity * item.item.price).toFixed(2);
      }
    });
  };

  $scope.removeFromBasket = function(basket_item_id) {
    BasketItem.delete({id: basket_item_id}, function(response) {
      if(response.id == basket_item_id) {
        var item_to_remove_index = -1;

        for(var i = 0; i < $scope.basket_items.length; ++i) {
          var item = $scope.basket_items[i];
          if(item.id == response.id) {
            item_to_remove_index = i;
            break;
          }
        }

        if(item_to_remove_index > -1) {
          $scope.basket_items.splice(item_to_remove_index, 1);
        }

      }
    });
  }

  $scope.$on('$viewContentLoaded', function(){
    $scope.getBasketItems();
  });

  $scope.getBasketCount();
  $scope.getBasketItems();
}]);