(function( $ ) {

    $.fn.reqwestr = {};

    reqwestr.get = function( requestUrl, callback ) {
        $.get('../api/reqwestr/' + requestUrl)
            .success(function(response){
                callback(response);
            });
    };

    reqwestr.post = function( requestUrl, data, callback ){
        $.post('../api/reqwestr/' + requestUrl, data)
            .success(function(response){
                callback(response);
            });
    };

})( jQuery );