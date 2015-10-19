(function( window ) {
    'use strict';
    function define_library(){
        var Reqwest = {};

        Reqwest.get = function( requestUrl, callback ) {
            axios.get('../api/reqwest/' + requestUrl)
                .then(function(response){
                    callback(response);
                });
        };

        Reqwest.post = function( requestUrl, data, callback ){
            axios.post('../api/reqwest/' + requestUrl, data)
                .then(function(response){
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