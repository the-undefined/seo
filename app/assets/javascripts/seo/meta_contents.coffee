toggleResourceLists = (resourceSelector, resourceTypeSelector) ->
  selectedType = resourceTypeSelector.find('option:selected').val()

  # de-select current selection
  resourceSelector.
    find('select').
    find('option:selected').
    prop('selected', false)

  # disable & hide all select tags that are not longer relevant
  resourceSelector.
    not("[data-klass='#{selectedType}']").
    find('select').
    prop('disabled','disabled').
    hide()

  # enable & show the now relevant select tag
  resourceSelector.
    filter("[data-klass='#{selectedType}']").
    find('select').
    prop('disabled', false).
    show()

  return

selectDBField = (id, resourceSelector) ->
  if id
    options = resourceSelector.find('select:visible').find('option')
    options.filter("[value='#{id}']").prop('selected', 'selected')
  return

jQuery ->
  resourceSelector = $('.resource-select-by-type')
  resourceTypeSelector = $('#meta_content_resource_type')
  idField = $('#meta_content_resource_id')

  if resourceSelector.length

    toggleResourceLists(resourceSelector, resourceTypeSelector)
    selectDBField(idField.val(), resourceSelector)

    resourceTypeSelector.change ->
      toggleResourceLists(resourceSelector, resourceTypeSelector)

    $('form').submit ->
      resource_id = $('.resource-select-by-type select:visible').val()
      idField.val(resource_id)

    return
  
