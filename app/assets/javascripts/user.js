
function(){
$('select[name="user[country_name]"]').change(function() {
  var input_state = $(this);
  var opt;
  var states=$('select[name="user[state_name]"]');
  $('select[name="user[city_name]"]').empty();
  $.getJSON('/states/' + $(this).val(), function (data) {
    states.empty();
    opt= '<option value="" selected="">Select State</option>'
    $.each(data, function (i, ele) {
      opt+='<option value='+ i +'>' + ele + '</option>';     
    }); states.html(opt);
  });  
});
});

function(){
$('select[name="user[state_name]"]').change(function() {
  var input_state = $(this);
  var opt;
  var cities=$('select[name="user[city_name]"]');
  $.getJSON('/cities/' + $(this).val(), function (data) {
    cities.empty();
    opt= '<option value="" selected="">Select City</option>'
    $.each(data, function (i, ele) {
      opt+='<option value='+ ele +'>' + ele+ '</option>';     
    }); cities.html(opt);
  });
});
});
