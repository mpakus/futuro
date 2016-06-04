class @Users
  constructor: ->
    @set_vars()
    @set_events()

  set_vars: ->
    @user_name = $('#user_name')
    @personal_uri = $('#user_personal_uri')
    @name_changed()

  set_events: ->
    $(document).on 'keyup', '#user_name', @name_changed.bind(@)

  name_changed: ->
    name = url_slug @user_name.val()
    @personal_uri.html(name)
