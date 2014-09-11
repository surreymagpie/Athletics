jQuery ->
  newHtml = $('.race_fields').html()
  $('.add_race').on 'click', (event) ->
    event.preventDefault()
    $('input[type=submit]').before('<fieldset class="race_fields">' + newHtml + '</fieldset>')

  $('.remove_race').on 'click', (event) ->
    event.preventDefault()
    $('fieldset.race_fields:last-of-type').remove()