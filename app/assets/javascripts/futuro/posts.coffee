class @Posts
  constructor: ->
    console.log 'init posts'
    $(document).on 'change', '#post_title', @save
    $(document).on 'change', '#post_blog_id', @save
    $(document).on 'change', '#post_tag_list', @save

  save: ->
    $('#post_publish').trigger('click')
#    $('#post_form').trigger('submit.rails')
#    e.preventDefault()
#    false
