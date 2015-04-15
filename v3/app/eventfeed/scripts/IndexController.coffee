angular
  .module('eventfeed')
  .controller("IndexController", ($scope, Eventfeed, supersonic) ->
    $scope.eventfeeds = null
    $scope.showSpinner = true

    Eventfeed.all().whenChanged (eventfeeds) ->
      $scope.$apply ->
        $scope.eventfeeds = eventfeeds
        $scope.showSpinner = false
  )