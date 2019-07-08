$(document).ready(function() {
  $('.subject .select-subject').select2();
  $('form').on('click', '.add_fields', function (event) {
    let regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.course-subjects').append($(this).data('fields').replace(regexp, time));
    $('select.select-subject').select2();
    return event.preventDefault();
  });

  $('form').on('click', '.remove_record', function (event) {
    $(this).siblings('input[type=hidden]').val('1');
    $(this).parent().hide();
    return event.preventDefault();
  });
});
