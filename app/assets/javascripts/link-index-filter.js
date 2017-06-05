$(document).ready(function(){
  searchFilter()
});

function searchFilter(){
  $('#search-box input').on("keyup", function(){
    $('.link-info').show()
    var searchValue = $(this).val()
    var links = $('.link-info')
    links.each(function(){

      var matchingSearch = $(this).text().includes(searchValue)
      if(!matchingSearch) {
        $(this).hide();
      }
    })
  })

}
