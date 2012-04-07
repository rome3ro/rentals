# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("fieldset.positioned").trigger "nested_fields_changed"
  $("fieldset").trigger "nested_fields_changed"

$("fieldset.positioned").live "nested_fields_changed", ->
  pos_fld = @getAttribute("data-positioned-by")
  repositionNestedFields this, pos_fld
  unless $(this).hasClass("ui-sortable")
    $(this).sortable update: ->
      repositionNestedFields this, pos_fld

$("fieldset").live "nested_fields_changed", ->
  $("fieldset").find("INPUT[id*=price]").maskMoney(symbol:'$ ', showSymbol:true, allowZero:true)
  $("fieldset").find("INPUT[id*=surcharge]").maskMoney(symbol:'$ ', showSymbol:true, allowZero:true)
  $("fieldset").find("INPUT[id*=movies_quantity]").maskMoney(precision: 0)
  $("fieldset").find("INPUT[id*=days]").maskMoney(precision: 0)