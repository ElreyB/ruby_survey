// $(document).ready(function(){
//   var $select1 = $( '#select1' ),
//   		$select2 = $( '#select2' ),
//       $options = $select2.find( 'option' );
//
//   $select1.on( 'change', function() {
//   	$select2.html( $options.filter( '[value="' + this.value + '"]' ) );
//   } ).trigger( 'change' );
// });

$(document).ready(function(){
  $('.0').removeClass("hide");
  $('#0').click(function(){
    $('.0').addClass("hide");
    $('.1').removeClass("hide");
  });
  $('#2').click(function(){
    $('.1').addClass("hide");
  });
});



// ruby first select box effects second select box
// https://stackoverflow.com/questions/10570904/use-jquery-to-change-a-second-select-list-based-on-the-first-select-list-option

// https://jsfiddle.net/fwv18zo1/
