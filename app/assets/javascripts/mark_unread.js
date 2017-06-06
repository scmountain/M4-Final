

function markAsUnRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('#link-list').context.id


  $.ajax({
    type: "PUT",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
};
