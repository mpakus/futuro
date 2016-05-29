class @PostsBlocksText
  constructor: ->
    $(document).on 'futuro:block:create:text', @on_create.bind(@)
    @create_editor()

  # Callback after when block created
  on_create: ->
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
