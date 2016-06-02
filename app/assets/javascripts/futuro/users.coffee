class @Users
  constructor: ->
    @set_vars()
    @set_events()

  set_vars: ->
    @user_name = $('#user_name')
    @personal_uri = $('#user_personal_uri')

  set_events: ->
    $(document).on 'keyup', '#user_name', @name_changed.bind(@)
    $(document).on 'change', '#user_personal_uri', @personal_uri_changed.bind(@)

  name_changed: (e, x)->
    name = url_slug @user_name.val()
    @personal_uri.val(name)

  personal_uri_changed: ->
    @personal_uri.val( url_slug(@personal_uri.val()) )

