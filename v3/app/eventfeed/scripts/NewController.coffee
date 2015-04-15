angular
  .module('eventfeed')
  .controller("NewController", ($scope, Eventfeed, supersonic) ->
    $scope.eventfeed = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      neweventfeed = new Eventfeed($scope.eventfeed)
      neweventfeed.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
