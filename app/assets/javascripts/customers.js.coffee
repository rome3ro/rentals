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
