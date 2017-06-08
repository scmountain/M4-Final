$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsUnRead)
})

function markAsUnRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id


  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(function(link){
    updateLinkFalse(link);
    updateBtnRead(link);
  })
}
function updateLinkFalse(link) {
  $(`#${link.id}`)[0].innerText = false
}
function updateBtnRead(link){
  $(`#${link.id}`)[0].nextElementSibling.className ="mark-as-read"
  $(`#${link.id}`)[0].childNodes[0].parentNode.nextSibling.nextSibling.value = "Mark as Read"
}
