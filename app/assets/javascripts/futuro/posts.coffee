class @Posts
  constructor: ->
    @init_post_events()
    @init_post_blocks()
    @init_post_header_uploader()

  init_post_header_uploader: ->
    return if $('.js_post_header_image_uploader').length <= 0
    $('.js_post_header_image_uploader').fileupload
      method:   'PATCH'
      dataType: 'json'
      done: (e, data)->
#        $(div).html("""<img src="#{data.result.image.mini.url}" alt="" />""")
      progressall: (e, data)->
        progress = parseInt(data.loaded / data.total * 100, 10)
        NProgress.set(progress)
      stop: ->
        NProgress.set(0)

  init_post_blocks: ->
    @blocks_text = new PostsBlocksText

  init_post_events: ->
    $(document).on 'change', '#post_title', @save
    $(document).on 'change', '#post_blog_id', @save
    $(document).on 'change', '#post_tag_list', @save

  save: ->
    $('#post_save').trigger('click')
