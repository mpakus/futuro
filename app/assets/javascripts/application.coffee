#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require bootstrap-sprockets
#= require nprogress
#= require nprogress-turbolinks
#= require_tree ./theme
#= require_tree ./futuro
#= require turbolinks
#= require jquery-fileupload/basic

class @Future
  setup_ajax: ->
    $.ajaxSetup
      data:
        authenticity_token: authenticity_token

  @ready: ->
    unless window.future?
      window.future = new Future
      window.future.once()
    window.future.always()

  once: ->
    @setup_ajax()
    FastClick.attach(document.body)
    @posts = new Posts

  always: ->

$(document).ready(Future.ready)
