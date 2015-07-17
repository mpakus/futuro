class @Menu
  constructor: ->

  always: ->
    console.log 'Menu.always'
    unless @jPM?
      console.log 'Menu.create'
      @jPM = $.jPanelMenu
        menu:        '#menu'
        trigger:     '.menu-trigger'
        animated:    false
        beforeOpen : ->
          if matchMedia('only screen and (min-width: 992px)').matches
            $('.sidebar').css("left", "250px")
        beforeClose: ->
          $('.sidebar').css("left", "0")
          $('.writer-icon, .side-writer-icon').removeClass("fadeOutUp")
    @jPM.on()
