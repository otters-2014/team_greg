//= require jquery
var messageCount = 0;
var userId = $('.messages').data('user-id');

function getMessageNode(){
  return $('.message-template').clone().removeClass('message-template');
};

function updateMessages(){
  var messageContent = '';

  $.get(window.location.pathname + '.json', function(messagesArray){
    $('.messages').html( getMessageNode().addClass('message-template') );
    $.each(messagesArray, function(i, messageInfo){
      var msg = getMessageNode();
      var sender;
      if (userId === messageInfo.sender_id) {
        sender = 'You';
        msg.addClass('message-sent');
      } else {
        sender = messageInfo.sender_name;
        msg.addClass('message-received');
      }


      var header = sender + " said this " + messageInfo.time_ago + " ago."
      var body = messageInfo.html_body;
      msg.find('.message-header').html(header);
      msg.find('.message-body').html(body);
      $('.messages').append( msg );
    });
  })
}

$(document).ready(function(){
  updateMessages();
  setInterval(function(){
    updateMessages();
  },2000);
})
