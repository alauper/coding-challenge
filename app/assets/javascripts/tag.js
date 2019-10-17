$(document).ready(function() {
  $('#clickable_tags a:last').click(function() {
    $('#clickable_tags').hide();
    $('#edit_tags').show();
    $('#tag_name').focus();
    return false;
  });

  $('#edit_tags a:last').click(function() {
    $('#clickable_tags').show();
    $('#edit_tags').hide();
  });
});