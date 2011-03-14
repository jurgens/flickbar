// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



$(function(){
  $(".watch .owner a.watched").live('click', function() {
    var id = $(this).closest(".watch").attr('id');
    if (id != null)
    {
      id = get_id(id);
      var url = '/watches/' + id + '/watched';
      $.post(url, {}, function(){
        console.log('watched callback');
      }, 'script');
    }
  });

  $(".watch .owner a.wish").live('click', function() {
    var id = $(this).closest(".watch").attr('id');
    if (id != null)
    {
      id = get_id(id);
      var url = '/watches/' + id + '/wish';
      $.post(url, {}, function(){
        console.log('wish callback');
      }, 'script');
    }
  });
});

function get_id(string)
{
  var r = string.match('^.+_([0-9]+)$');
  if (r.length == 2)
  {
    return r[1];
  }
  return null;
}