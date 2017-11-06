# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $(document).ready ->

    cart = []

    if getCookie 'cart'
      if isJson(getCookie 'cart')
        cart = JSON.parse(getCookie 'cart')

    rawCart = parseCookie cart
    token = $('meta[name="csrf-token"]').attr('content')

    $.ajax '/shop/getCart',
      type: 'POST'
      data: {rawCart: rawCart,authenticity_token: token}
      dataType: 'html'
      async:false
      error: (jqXHR, textStatus, errorThrown) ->
        console.log textStatus
      success: (data, textStatus, jqXHR) ->
        res = JSON.parse(data)

        if res.result
          if res.infor
            array = res.infor
            component = ''
            sum = 0
            for item,value of array
              a = fin(rawCart,value.id)
              sum += (value.price*a.num)
              component += '<tr>'
              component += '<td>'+value.name+'</td>'
              component += '<td>'+a.num+'</td>'
              component += '<td>$'+value.price+'</td>'
              component += '<td>$<span class="priceitem">'+(value.price*a.num)+'</span></td>'
              component += '<td><button class="btn btn-link deleteInCart" value="'+value.id+'"><span aria-hidden="true">×</span></button></td>'
              component += '</tr>'
            component += '<tr><td colspan="3"></td><td colspan="2" id="sumcart">$'+sum+'</td></tr>'
            $('.tablecart').html component
            $('#totalcart').html('$'+(sum+$('#shiping_cost').val()*1))



    $('.add_cart').click ->
      id = $(this).val()
      cart.push id
      createCookie('cart', JSON.stringify(cart), 0.5)
      console.log getCookie 'cart'


    $(document).on "click",".deleteInCart", ->
      id = $(this).val()
      a = removeA(cart,id)
      createCookie('cart', JSON.stringify(a), 0.5)
      $(this).parent().parent().remove()
      sum = 0

      if $('.priceitem').length > 0
        for k,v of $('.priceitem')
          if v.innerHTML
            sum += v.innerHTML*1
      else
        sum = 0
      $('#sumcart').html('$'+sum)
      $('#totalcart').html('$'+(sum+$('#shiping_cost').val()*1))


    $('.open_cart').click ->
      rawCart = parseCookie cart
      token = $('meta[name="csrf-token"]').attr('content')

      $.ajax '/shop/getCart',
        type: 'POST'
        data: {rawCart: rawCart,authenticity_token: token}
        dataType: 'html'
        async:false
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
          res = JSON.parse(data)

          if res.result
            if res.infor
              array = res.infor
              component = ''
              sum = 0
              for item,value of array
                a = fin(rawCart,value.id)
                sum += (value.price*a.num)
                component += '<tr>'
                component += '<td>'+value.name+'</td>'
                component += '<td>'+a.num+'</td>'
                component += '<td>$'+value.price+'</td>'
                component += '<td>$<span class="priceitem">'+(value.price*a.num)+'</span></td>'
                component += '<td><button class="btn btn-link deleteInCart" value="'+value.id+'"><span aria-hidden="true">×</span></button></td>'
                component += '</tr>'
              component += '<tr><td colspan="3"></td><td colspan="2" id="sumcart">$'+sum+'</td></tr>'
              $('.tablecart').html component

    $('#createOrder').click ->
      $(this).attr('disabled', 'disabled')

      order_product = parseCookie cart

      shiping_info = {shiping_type: $('#shiping_type').val(),shiping_cost: $('#shiping_cost').val(),adress: $('#adress').val() }

      console.log shiping_info
      console.log order_product

      $.ajax '/shop/createorder',
        type: 'POST'
        data: {shiping_info:shiping_info,order_product: order_product,authenticity_token: token}
        dataType: 'html'
#        async:false
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
          res = JSON.parse(data)
          if res.result
            cart = []
            createCookie('cart', JSON.stringify(cart), 0.5)
            window.location = "/shop/my_order";