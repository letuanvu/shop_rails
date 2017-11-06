//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require front/jquery-1.11.1.min
//= require front/bootstrap.min
//= require front/responsiveslides.min
//= require front/skdslider.min
//= require front/easing
//= require front/move-top
//= require_self
//= require front/index
//= require order

var cart = []

var createCookie = function(name, value, days) {
    var expires;
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    }
    else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = document.cookie.length;
            }
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}

function isJson(text) {
    if (/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g, '@').
        replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
        replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

        //the json is ok
        return true

    }else{
        return false
        //the json is not ok

    }
}

function parseCookie(array) {
    var res = [];
    var leng = array.length;
    for(i = 0; i < leng; i++) {
        var obj = res.find(x => x.id === array[i]);
        if(obj) {
            obj.num ++
        } else {
            res.push({id: array[i], num:1});
        }
    }
    return res
}

function fin(array,id) {
    var a = array.find(x => x.id == id);
    return a;
}

function removeA(arr) {
    var what, a = arguments, L = a.length, ax;
    while (L > 1 && arr.length) {
        what = a[--L];
        while ((ax= arr.indexOf(what)) !== -1) {
            arr.splice(ax, 1);
        }
    }
    return arr;
}

function delete_cookie( name ) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}