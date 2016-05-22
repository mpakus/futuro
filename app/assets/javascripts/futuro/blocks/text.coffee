class @PostBlockText
  constructor: ->
    $(document).on 'change', '.post-block-text', @save

  save: ->
    $this = $(@)
    url = $this.data('url')
    text = $this.val()
    $.ajax
      url:      url
      method:   'PATCH'
      data:     { text: text }
      dataType: 'json'
      success: (data)->
        console.log data.status

