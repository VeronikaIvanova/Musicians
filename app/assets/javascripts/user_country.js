$(document).on('ready page:load', function () {
 $('#user_country_id').change(function(event){
      $("#user_state_id").attr('disabled', 'disabled')          
      $.ajax({
     type:'post',
     url:'/update_states/',
     data:{ country_id: $(this).val() },
     dataType:"script"
   });
  event.stopImmediatePropagation();
});