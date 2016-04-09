
app.controller("BasketsCtrl", ["$scope", "BasketItem", function($scope, BasketItem) {
  $scope.addToBasket = function(item_id) {

    console.log("Clicked");
    console.log(item_id, $scope.item_quantity);
    // BasketItem.post({
    //   basket_item: {
    //     item_id: item_id
    //     quantity: quantity
    //   }
    // }, function(response) {
    //   console.log(response);
    // });
  };

}]);