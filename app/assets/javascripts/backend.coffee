angular.module 'backend', ['ngResource']

.config(['$httpProvider', ($http) ->
    authToken = $("meta[name=\"csrf-token\"]").attr('content')
    $http.defaults.headers.common['X-CSRF-TOKEN'] = authToken
])
