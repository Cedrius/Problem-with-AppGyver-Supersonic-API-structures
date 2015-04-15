angular
  .module('eventfeed')
  .controller("EditController", ($scope, Eventfeed, supersonic) ->
    $scope.eventfeed = null
    $scope.showSpinner = true

    supersonic.ui.views.current.params.onValue (values) ->
      Eventfeed.find(values.id).then (eventfeed) ->
        $scope.$apply ->
          $scope.eventfeed = eventfeed
          $scope.showSpinner = false

    $scope.submitForm = ->
      $scope.showSpinner = true
      $scope.eventfeed.save().then ->
        supersonic.ui.modal.hide()

    $scope.cancel = ->
      supersonic.ui.modal.hide()
  )
