$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnRead)
})

function markAsUnRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id


  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  debugger

  $(`#link-list[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
