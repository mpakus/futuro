class @Posts
  constructor: ->
    @init_post_title_panel()
    @init_post_events()
    @init_post_blocks()
    @init_post_header_uploader()

  init_post_title_panel: ->
    $(document).on 'click', '.js-post-form-settings-btn', (e)->
      $post_form_panel = $('#post_form_panel')
      console.log $post_form_panel.height()
      if $post_form_panel.height() == 118
        $post_form_panel.animate({height: '200px'}, 500)
      else
        $post_form_panel.animate({height: '120px'}, 500)
      false
      e.preventDefault()

  init_post_header_uploader: ->
    return if $('.js_post_header_image_uploader').length <= 0
    $('.js_post_header_image_uploader').fileupload
      method:   'PATCH'
      dataType: 'json'
#      done: (e, data)->
      progressall: (e, data)->
        progress = parseInt(data.loaded / data.total * 100, 10)
        NProgress.set(progress)
      stop: ->
        NProgress.set(0)

  init_post_blocks: ->
    @blocks_text = new PostsBlocksText
    @blocks_album = new PostsBlocksAlbum

  init_post_events: ->
    $(document).on 'change', '#post_title', @save
    $(document).on 'change', '#post_blog_id', @save
    $(document).on 'change', '#post_tag_list', @save

  save: ->
    $('#post_save').trigger('click')
