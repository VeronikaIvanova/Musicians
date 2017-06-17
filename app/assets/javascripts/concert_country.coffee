jQuery ->
  states = $('#concert_state_id').html()
  $('#concert_country_id').change ->
    country = $('#concert_country_id :selected').text()
    options = $(states).filter("optgroup[label='#{country}']").html()
    if options
      $('#concert_state_id').html(optioms)
    else
      $('#concert_state_id').empty()

