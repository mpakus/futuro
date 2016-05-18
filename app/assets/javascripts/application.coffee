#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require bootstrap-sprockets
#= require nprogress
#= require nprogress-turbolinks
#= require_tree ./theme
#= require turbolinks

class @Future
#  run: ->
#    @setup_ajax()

#  setup_ajax: ->
#    $.ajaxSetup
#      data:
#        authenticity_token: authenticity_token

  @ready: ->
    unless window.future?
      window.future = new Future
      window.future.once()
    window.future.always()

  once: ->
    FastClick.attach(document.body)

  always: ->

$(document).ready(Future.ready)
