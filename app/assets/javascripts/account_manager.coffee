# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).ready ->
    $('#example1').DataTable()

    activeMenu = 'dashboard'
    if window.location.pathname != '/'
      activeMenu = window.location.pathname.split('/')[1]

    $('#'+activeMenu).attr('class','active')

    $('.detailAccount').click ->
      id = $(this).val()
      $('#idAcc').val(id)

      $.ajax '/account/getdetailaccount',
        type: 'GET'
        data: {id: id}
        dataType: 'html'
        async:false
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
          res = JSON.parse(data)
          if res.result
            if !!res.accounts
              $('#nameAdmin').val(res.accounts.admin_name)
              $('#idAdmin').val(res.accounts.id)
            else
              $('#nameAdmin').val('')
              $('#idAdmin').val('')