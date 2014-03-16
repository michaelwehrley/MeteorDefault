Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  waitOn: ->
    #

requireLogin = ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render "accessDenied"
    @stop()

# Router.before requireLogin,
#   only: "home"

Router.map ->
  @route "home",
    path: "/"