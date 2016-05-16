
$(document).on("ajax:success", '.btn-primary', function(e, data) {
  $('.comments-container').append('input');
});
