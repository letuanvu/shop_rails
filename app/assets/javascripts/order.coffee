# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).ready ->

    $('.detailOrder').click ->
      id = $(this).val()

      $.ajax '/order/getdetailorder',
        type: 'GET'
        data: {id: id}
        dataType: 'html'
        async:false
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
          res = JSON.parse(data)

          if res.result
            if !!res.order
              html = ''
              array = res.order
              index = 0
              for key,item of array
                html += '<tr>'
                html += '<td>'+(index+=1)+'</td>'
                html += '<td>'+item.name+'</td>'
                html += '<td>'+item.price+' $</td>'
                html += '<td>'+item.unit_price+'</td>'
                html += '</tr>'
              $('#dataproduct').html(html)
            if res.ship[0].id
              htmll = ''
              arrayship = res.ship
              index = 0
              for keym,item of arrayship
                htmll += '<tr>'
                htmll += '<td>'+(index+=1)+'</td>'
                htmll += '<td>'+item.shipping_type+'</td>'
                htmll += '<td>'+item.shipping_cost+' $</td>'
                htmll += '<td>'+item.shipping_region_id+'</td>'
                htmll += '</tr>'
              $('#dataship').html(htmll)
            else
              htmll += '<tr>'
              htmll += '<td colspan="4" class="text-center">Empty</td>'
              htmll += '</tr>'
              $('#dataship').html(htmll)