$ ->
  $(".js-ping").click ->
    url = $(@).attr("href")
    $.post url, (data) ->

    return false