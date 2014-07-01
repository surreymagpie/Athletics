jQuery ->
  races = $('#results_race_id').html()
  $('#results_race_id').closest('.field').hide();
  $('#results_fixture_id').change ->
    fixture = $('#results_fixture_id :selected').text()
    options = $(races).filter("optgroup[label='#{fixture}']").html()
    if options
      $('#results_race_id').html(options).closest('.field').slideDown()
    else
      $('#results_race_id').empty().closest('.field').slideUp()