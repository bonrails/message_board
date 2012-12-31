# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.alert-success').delay(1500).slideUp(1500)

  $(".message_delete").bind "ajax:success", (xhr, data, status) =>
    $("#"+data).remove();