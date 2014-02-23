Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/"

requireLogin = ->
  unless Meteor.user()
    if Meteor.loggingIn()
      @render @loadingTemplate
    else
      @render "accessDenied"
    @stop()
  return

# Router.before requireLogin,
#   only: "home"