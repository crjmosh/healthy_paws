  $(document).ready(function() {
    $('select').material_select();
  });

  $(function() {
      if($.fn.cloudinary_fileupload !== undefined) {
        $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
      }
    });