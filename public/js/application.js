$(document).ready(function () {
  $('div.event a').on('click',function(event){
    event.preventDefault();

    var path = $(this).attr('href'),
        id_name = $(this).parents().eq(2).attr('id');

    $.ajax({
      method: 'GET',
      url: path,
      dataType: 'html'
    })

    .done(function(response){
      $('#' + id_name + ' .event-info').remove();
      $('#' + id_name).append(response);
    });
  });

  $('div[id^="event"] div').on('submit', 'form', function(event){
    event.preventDefault();

    var path = $(this).attr('action'),
        method = $(this).attr('method'),
        data = $(this).serialize();

    $.ajax({
      method: method,
      url: path,
      data: data,
      dataType: 'json'
    })

    .done(function(response){
      if (response.delete_route){
        $('#event' + response.id).remove();
      }
      else{
        $('#event' + response.id + ' .participants').html(response.participants);
        $('#event' + response.id + ' .event-info').remove();
      }
    });
  });
});
