$(document).ready(function() {
  $('.js-open-modal').on('click', loadArticle);
});


function loadArticle() {
  $.ajax({
    url: $(this).data("url"),
    method: "GET",
    dataType: "json",
    success: function(data){
      var modal = $('#show');

      modal.find('.modal-title').html(data.title);
      modal.find('.modal-body').html(data.text);
      modal.modal();
    }
  });
};
