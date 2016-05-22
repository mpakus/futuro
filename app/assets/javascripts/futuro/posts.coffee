class @Posts
  constructor: ->
    @init_post_events()
    @init_post_blocks()

  init_post_blocks: ->
    @block_text = new PostBlockText

  init_post_events: ->
    $(document).on 'change', '#post_title', @save
    $(document).on 'change', '#post_blog_id', @save
    $(document).on 'change', '#post_tag_list', @save

  save: ->
    $('#post_save').trigger('click')
