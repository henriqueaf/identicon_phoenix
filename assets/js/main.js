document.addEventListener("DOMContentLoaded", function(){
  const $generateIdenticonLink = $("#generateIdenticonLink");

  $generateIdenticonLink.click((e) => {
    e.preventDefault();
    const nameString = $("#nameString").val();

    $("#identiconImg").prop("src", `/identicon/${nameString}`);
  });

  $("#generateIdenticonForm").submit((e) => {
    e.preventDefault();
    $generateIdenticonLink.trigger('click');
  })
});
