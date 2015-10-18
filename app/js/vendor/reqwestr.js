(function( window ) {
    'use strict';
    function define_library(){
        var Reqwest = {};

        Reqwest.get = function( requestUrl, callback ) {
            $.get('../api/reqwest/' + requestUrl)
                .success(function(response){
                    callback(response);
                });
        };

        Reqwest.post = function( requestUrl, data, callback ){
            $.post('../api/reqwest/' + requestUrl, data)
                .success(function(response){
                    callback(response);
                });
        };


        return Reqwest;
    }
    //define globally if it doesn't already exist
    if(typeof(Reqwest) === 'undefined'){
        window.Reqwest = define_library();
    }
})(window);