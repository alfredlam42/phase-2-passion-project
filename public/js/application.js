$(document).ready(function () {
  $('div.event a').on('click',function(event){
    event.preventDefault();

    var path = $(this).attr('href'),
        id_name = $(this).parents().eq(2).attr('id');
    console.log(id_name);

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
});
