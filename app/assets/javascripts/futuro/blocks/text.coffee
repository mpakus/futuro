class @PostsBlocksText
  constructor: ->
    @create_editor()

  create_editor: ->
    return unless $('.editor').length > 0
    @editor = new MediumEditor '.editor',
      delay: 1000
      taretBlank: true
      paste:
        cleanPastedHTML: true
        cleanAttrs: ['style', 'dir']
        cleanTags: ['label', 'meta', 'script']
      anchorPreview:
        hideDelay: 300
    @editor.subscribe 'editableInput', @text_changed

  set_autogrow: ->
    $('.post-block-text').autogrow( { vertical: true, horizontal: false } );

  text_changed: (e, editor)->
    $editor = $(editor)
    text = $editor.html()
    len = text.length
    return if Math.abs(len - @counter) < 15

    @counter = len
    url = $editor.data('url')
    $.ajax
      url:      url
      method:   'PATCH'
      data:     { text: text }
      dataType: 'json'
