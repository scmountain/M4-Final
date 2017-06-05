$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id


  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus, sendToHawt)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`#link-list[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function sendToHawt(link){

  $.ajax({
    type: "POST",
    url: "http://localhost:9876/links" + linkId,
    data: { url: link.url },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}
