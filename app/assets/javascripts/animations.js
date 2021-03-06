
$(function() {

  var pos = $("#basket").offset();
  var basketCount = $("#basketCount");
  basketCount.offset({top: pos.top, left: pos.left + 16});

});

function shakeBasket() {
  $("#basket").effect( "shake", {
    times: 3,
    distance: 3,
    direction: "right"
  }, 500 );
}

function showItemAddedNotification() {
  var pos = $("#basket").offset();
  var basketNotify = $("#basketNotify")
  basketNotify.offset({top: pos.top, left: pos.left});
  // basketNotify.fadeIn(300, function() {
  //   $(this).delay(3000).fadeOut(300);
  // });
}

$(function() {
  $(".notice").delay(3000).fadeOut('slow');
});

$(document).ready(function() {
    $('.sortSelection').material_select();
});