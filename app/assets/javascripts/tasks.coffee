# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $("#sortable").disableSelection()

  $('#close').click ->
    $('#close').hide()
    $('#form').fadeOut()

  $('#short').click ->
    $('#short').hide()
    $('#full').show()
    $('.add').fadeOut()

  $('#full').click ->   
    $('#full').hide()
    $('#short').show()
    $('.add').fadeIn()