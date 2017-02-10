# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#show-tasks').click ->
    $('#show-tasks').hide()
    $('#close-tasks').show()
    $('.tasks').fadeIn()        

  $('#close-tasks').click ->
    $('#close-tasks').hide()
    $('#show-tasks').show()
    $('.tasks').fadeOut()      
    $('#form').hide()
    $('#close').hide()      

  $('#close').click ->   
    $('#close').hide()  
    $('#form').fadeOut()
