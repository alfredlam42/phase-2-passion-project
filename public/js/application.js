$(document).ready(function () {
  $('td.event_title a').on('click', function(event){
    event.preventDefault();

    var path = $(this).attr('href'),
        id_name = $(this).parent().parent().attr('id');

    $.ajax({
      url: path,
      dataType: 'html'
    })

    .done(function(response){
      $('#' + id_name).after(response);
    });
  });

  $('table.table').on('click', '.event-button', function(event){
    event.preventDefault();

    test = $(this).parent().parent().parent().prev().attr('id');
    console.log(test);

    var path = $('form.rsvp-form').attr('action'),
        method = $('form.rsvp-form').attr('method'),
        data = $('#' + test).next().attr('value');

    $.ajax({
      method: method,
      url: path,
      data: {route_id: data},
      dataType: 'json'
    })

    .done(function(response){
      // console.log(response);
      // $('#event' + response.id + ' td.participants').html(response.participants);
    });
  });
});
