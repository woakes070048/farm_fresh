
app.controller("BasketsCtrl", ["$scope", "BasketItem", "$http", "$timeout", function($scope, BasketItem, $http, $timeout) {

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

  $scope.getBasketCount();
}]);