#= require jquery
#= require bootstrap-sprockets
#= require jquery.turbolinks
#= require jquery_ujs
#= require nprogress
#= require nprogress-turbolinks
#= require_tree ./theme
#= require_tree ./futuro
#= require turbolinks
#= require jquery-fileupload/basic
#= require medium-editor
# require rails-ujs
#= require js/scripts


class @Future
  setup_ajax: ->
    $.ajaxSetup
      data:
        authenticity_token: authenticity_token
    $(document).on 'ajaxSend', -> NProgress.start()
    $(document).on 'ajaxComplete', -> NProgress.done()

  @ready: ->
    unless window.future?
      window.future = new Future
      window.future.once()
    window.future.always()

  once: ->
    @setup_ajax()
    FastClick.attach(document.body)
    @posts = new Posts
    @notification = new Notification
    @users = new Users

  always: ->
    #  @TODO: try to fix Tooltip plugin
#    $('[data-toggle="tooltip"]').tooltip()
#    $('body').tooltip({ selector: '[data-toggle=tooltip]' })

$(document).ready(Future.ready)
