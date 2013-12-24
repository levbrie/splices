chardinReady = ->
  $('body').chardinJs()

  $('a[data-toggle="chardinjs"]').on 'click', (e) ->
    e.preventDefault()
    ($('body').data('chardinJs')).toggle()

  $('body').on 'chardinJs:stop', ->
    $('a.btn.primary').off('click').text('See more on Github')
      .attr('href', 'https://github.com/heelhook/chardin.js')
    $('a#opentour').css display: 'block'

$(document).ready(chardinReady)
$(document).on('page:change', chardinReady)