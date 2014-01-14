# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@file_selected = ->
  file_path = ($("#file").val()).split("\\")
  file_name = (file_path[file_path.length-1]).replace(/\.[^/.]+$/, "")
  $("#file_name").val(file_name)
