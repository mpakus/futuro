class @PostsBlocksAlbum
  constructor: ->
    $(document).on 'futuro:block:create:album', @on_create.bind(@)
    @create_uploaders()

  # Callback after when block created
  on_create: ->
    @create_uploaders()

  create_uploaders: ->
    $('.js_post_album_image_uploader').fileupload
      method:   'POST'
      dataType: 'script'
#      done: (e, data)->
      progressall: (e, data)->
        progress = parseInt(data.loaded / data.total * 100, 10)
        NProgress.set(progress)
      stop: ->
        NProgress.set(0)
