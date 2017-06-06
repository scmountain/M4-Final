$(document).ready(function(){
  readFilter()
});

function readFilter(){
  $('#read-btn').on("click", function(){
    $('.link-info').show()
    var links = $('.link-info')
    links.each(function(){

      var matchingSearch = $(this).text().includes("true")
      if(!matchingSearch) {
        $(this).hide();
      }
    })
  })

}
