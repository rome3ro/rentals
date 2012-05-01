# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@sumar = ->
  arr = $("#details").find("input[id*=price]")
  #alert arr.length
  total = 0
  arr.each (index, item) ->
    #alert $(item).val()
    precio = parseFloat($(item).val())
    precio = 0  if isNaN(precio)
    total += precio

  $("#rent_total").val total

$ ->
  $(".remove_deal").live "click", (event) ->
    $(this).closest("#deal").remove()
    sumar()

  $("#rent_customer_code_name").bind "railsAutocomplete.select", (event, data) ->
    $.ajax
      url: "validate_customer"
      data: "customer_id=" + data.item.value
      type: "POST"
      dataType: "script"
      beforeSend: (dato) ->
        #$(".container").empty().html "<img src=\"../assets/rails.png\" />"