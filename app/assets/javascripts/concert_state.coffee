jQuery ->
 cities = $('#concert_city_id').html()
 $('#concert_city_id').change ->
    state = $('#concert_state_id :selected').text()
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#concert_city_id').html(optioms)
    else
      $('#concert_city_id').empty()
