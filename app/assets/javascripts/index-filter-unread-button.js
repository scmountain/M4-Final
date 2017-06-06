$(document).ready(function(){
  readFilter()
});

function readFilter(){
  $('#unread-btn').on("click", function(){
    $('.link-info').show()
    var links = $('.link-info')
    links.each(function(){

      var matchingSearch = $(this).text().includes("false")
      if(!matchingSearch) {
        $(this).hide();
      }
    })
  })

}
