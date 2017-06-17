
jQuery ->
  cities = $('#group_city_id').html()
$('#group_city_id').change ->
    state = $('#group_state_id :selected').text()
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#group_city_id').html(optioms)
    else
      $('#group_city_id').empty()
