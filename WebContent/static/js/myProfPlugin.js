$(function(){

  $(document).on("change","#file",function(){
  var path = $('#file').val();
  $('#imgProf').attr('src', path);
});

});
