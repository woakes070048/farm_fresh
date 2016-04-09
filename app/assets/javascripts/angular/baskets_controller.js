
app.controller("BasketsCtrl", ["$scope", "BasketItem", function($scope, BasketItem) {
  $scope.addToBasket = function(item_id) {

    BasketItem.save({
      basket_item: {
        item_id: item_id,
        quantity: $scope.item_quantity
      }
    }, function(response) {
      console.log(response);
      shakeBasket();
      var pos = $("#basket").offset();
      var basketNotify = $("#basketNotify")
      basketNotify.offset({top: pos.top, left: pos.left});
      basketNotify.fadeIn(300, function() {
        $(this).delay(3000).fadeOut(300);
      });
    });

  };

}]);