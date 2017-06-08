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
    sendHawt(link);
    updateLinkTrue(link);
    updateBtnUnread(link);
  })
}

function updateLinkTrue(link) {
  $(`#${link.id}`)[0].innerText = true
}

function sendHawt(link){
  $.ajax({
    type: "POST",
    url: "https://the-hawt-reads.herokuapp.com/links",
    data: { url: link.url},
  })
}
function updateBtnUnread(link){
  $(`#${link.id}`)[0].nextElementSibling.className ="mark-as-unread"
  $(`#${link.id}`)[0].childNodes[0].parentNode.nextSibling.nextSibling.value = "Mark as Unread"
}
