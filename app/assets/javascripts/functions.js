if(jQuery) {
  //jQuery.extend(window, Routes)
}

function alert_message(message, status) {
  var sanitized_status = status === "success" ? "success" : "danger";

  if($("#flash_message").length > 0) {
    ensure_flash_message_content_container()

    $("#flash_message .message_content").html(message);
    $("#flash_message").attr("class", 'alert alert-' + sanitized_status + ' alert-dismissable').
      show();
  } else {
    var flash = '<div class="container"><div id="flash_message" class="alert alert-' + sanitized_status + ' alert-dismissable">' +
      '<p class="message_content" style="display:inline">' + message + '</p>' +
      '<a class="close" href="#" onclick="return false">x</button>' +
      '</div></div>';

    $(".container").first().prepend(flash);
  }

  setTimeout(function() { $("#flash_message").fadeOut(); }, 5000);
}

function ensure_flash_message_content_container() {
  if($("#flash_message .message_content").length == 0) {
    $("#flash_message").html('<p class="message_content" style="display:inline"></p>' +
      '<a class="close" href="#" onclick="return false">x</button>')
  }
}

var delete_resource = function(url_path, grid_id) {
  var user_selection = confirm("Are you sure that you want to delete this resource?")

  if(user_selection == true) {
    $.ajax({
      url: url_path,
      type: "DELETE",
      dataType: "html",
      success: function(data) {
        if(grid_id.length > 0) {
          $("#" + grid_id).html(data)
        }
      }
    });
  }
}

$.fn.enterKey = function (fnc) {
  return this.each(function () {
    $(this).keypress(function (ev) {
      var keycode = (ev.keyCode ? ev.keyCode : ev.which);
      if (keycode == '13') {
        fnc.call(this, ev);
      }
    })
  })
}
