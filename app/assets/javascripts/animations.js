
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
  }, 1000 );
}

// $(function() {

//   $(".basketIcon").mouseover(function() {
//     $(this).animate({
//       width: 36,
//       height: 36
//     }, 100);
//   });

//   $(".basketIcon").mouseleave(function() {
//     $(this).animate({
//       width: 32,
//       height: 32
//     }, 100);
//   });

// });

// function addEvents() {
//   $('.basketIcon').on('mouseenter', function(){
//      $(this).animate({
//        width: 36,
//        height: 36
//      }, 100);
//   });

//   $('.basketIcon').on('mouseleave', function(){
//      $(this).animate({
//        width: 32,
//        height: 32
//      }, 100);
//   });
// }