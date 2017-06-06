$( document ).ready(function(){
  $(".mark-as-read").on("click", markAsRead)
  $(".mark-as-unread").on("click", markAsUnRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id
debugger
  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
};

function updateLinkStatus(link) {
  $(`#link-list[link-id=${link.id}]`).find(".read-status").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
