$( function() {

  $('form#new_inquiry').submit( function() {
    $('#inquiry_client_viewport_size', this).val( $(window).width() +'x'+ $(window).height() )
  })

})
