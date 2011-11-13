class window.Startup
  constructor: ->
    @input_description = $('#startup_description')
    @setupDescriptionChange()


  setupDescriptionChange: ->
    $('#description_characters_left').hide()
    @input_description.bind 'textchange', (event, previousText) ->
      limit = parseInt $(this).attr('maxlength')
      total = limit - parseInt($(this).val().length)

      if total is limit or total is 0
        $('#description_characters_left').hide()
        $('#description_characters_left span').html ''
      else
        $('#description_characters_left').show()
        $('#description_characters_left span').html total