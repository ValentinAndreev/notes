# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#sortable').sortable(
    axis: 'y'
    items = $(".item").data()
    cursor: 'move'
    update: (e, ui) ->
      item_id = ui.item.data('item-id')
      position = ui.item.index() 
      $.ajax(
        type: 'POST'
        url: '/plans/update_row_order'
        dataType: 'json'
        data: { plan: {plan_id: item_id, row_order_position: position } }
      )
  )