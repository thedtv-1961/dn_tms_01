$(document).ready(function() {
  $('.tasks .select-task').select2();

  $('form').on('click', '.add_fields', function (event) {
    let regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.subject-tasks .panel-body').append($(this).data('fields').replace(regexp, time));
    $('select.select-task').select2();
    return event.preventDefault();
  });

  $('form').on('click', '.remove_record', function (event) {
    $(this).siblings('input[type=hidden]').val('1');
    $(this).closest('.task').hide();
    return event.preventDefault();
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();
      reader.onload = function(e) {
        $('#picture-preview').css('background-image', 'url('+e.target.result +')');
        $('#picture-preview').hide();
        $('#picture-preview').fadeIn(650);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#subject_picture").change(function() {
    readURL(this);
  });
});
