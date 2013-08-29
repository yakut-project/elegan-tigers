# This is a manifest file that will be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require_tree .



$(document).ready ->

  # Enable Tips & Popovers
  $('[data-toggle=tooltip]').tooltip()
  $('[data-toggle=popover]').popover()

  # Eable Dropdowns
  $('.dropdown-toggle').dropdown()
  $('.dropdown.hover').hover (->
    $(this).find('.dropdown-menu').stop(true, true).fadeIn()
  ), ->
    $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut()

  # Dock dropdown fix
  $('#dock li.launcher').each ->
    $(this).find('.dropdown-menu').css 'top', $(this).position().top + 33

  $('#toggle').click ->
    $('#dock .launcher a').toggle()
    $('#dock li.launcher').each ->
      $(this).find('.dropdown-menu').css 'top', $(this).position().top + 33

  # Enable toolbar tooltips
  $('[data-toggle=toolbar-tooltip]').tooltip
    placement: 'bottom'

  # Enable knob inputs
  $('.knob').knob()