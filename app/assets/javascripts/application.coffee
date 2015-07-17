#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require bootstrap-sprockets
#= require nprogress
#= require nprogress-turbolinks
#= require_tree ./theme
#= require_tree ./app
#= require turbolinks


class @Future
  constructor: ->
    @menu = new Menu

#  run: ->
#    @setup_ajax()

#  setup_ajax: ->
#    $.ajaxSetup
#      data:
#        authenticity_token: authenticity_token

  @ready: ->
    unless window.future?
      window.future = new Future
    window.future.always()

  always: ->
    @menu.always()
    full_height = $(window).height()
    $('.hero-image-404').css('height', full_height )
    main_content = $('.main-content')
    if main_content.length
      main_content.css('height', full_height) if main_content.height() < full_height

$(document).ready(Future.ready)