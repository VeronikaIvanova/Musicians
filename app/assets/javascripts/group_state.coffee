# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  states = $('#group_state_id').html()
  $('#group_country_id').change ->
    country = $('#group_country_id :selected').text()
    options = $(states).filter("optgroup[label='#{country}']").html()
    if options
      $('#group_state_id').html(optioms)
    else
      $('#group_state_id').empty()

 