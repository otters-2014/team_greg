$(function() {
  console.log("in jQuery");
  $('#message_form').on('submit', function(event) {
    event.preventDefault();
    var message = $('#message_text').val();
    var conversation_id = $("#conversation_id").val();
    console.log($(this).serialize());
    $('.message_area').append("<p>" + message + "</p>");
    $.ajax({
      type: "POST",
      url: '/messages',
      data: {text: message, id: conversation_id},
      success: function(response){
        $('.message_area').append("<p>" + message + "</p>");
      }
    });
  });
});
