$(document).ready(function () {
  function handleSelect(){
    $('.select-user').on('select2:select', function (event) {
      let data = $(this).find(':selected').data();
      let gender = data.gender == 1 ? 'male' : 'female';
      let img_url = data.avatar.url;
      if (img_url == null){
        img_url = data.avatar.thumb.url
      }
      $(this).closest('.fullname-col').next().html('<span>'+data.email+'</span>');
      $(this).closest('.fullname-col').siblings('.gender-col').html('<i class="fa fa-'+gender+'"></i>');
      $(this).closest('.fullname-col').siblings('.avatar-col').html('<img class="img-circle avatar-size" src="'+img_url+'"></img>');
    });
  }

  $('.course-users .select-user').select2();

  $('form').on('click', '.add_fields', function (event) {
    let regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.course-users .trainees').prepend($(this).data('fields').replace(regexp, time));
    $('.course-users .select-user').select2();
    handleSelect();
    return event.preventDefault();
  });

  $('form').on('click', '.remove_record', function (event) {
    $(this).siblings('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      let reader = new FileReader();
      reader.onload = function (e) {
        $('#picture-preview').css('background-image', 'url(' + e.target.result + ')');
        $('#picture-preview').hide();
        $('#picture-preview').fadeIn(650);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#course_picture").change(function () {
    readURL(this);
  });


  handleSelect();

});

