$( document ).ready(function(){
  $(".mark-as-read").on("click", markAsRead)
  $(".mark-as-unread").on("click", markAsUnRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id

  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(function(link){
    return $.ajax({
      type: "POST",
      url: "http://hawt-reads.herokuapp.com/links",
      data: { url: link.url},
    })
  })
    .fail(displayFailure);
};

function updateLinkStatus(link) {
  var oldText = $(`#${link.id}`)[0].innerText
  oldText.relpace(link.read)
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function sendHawt(link){

  $.ajax({
    type: "POST",
    url: "http://localhost:9876/links" + linkId,
    data: { url: link.url },
  })
}
