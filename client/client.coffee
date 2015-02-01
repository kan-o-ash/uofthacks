Meteor.subscribe("currentUserData")

Meteor.startup ->
  # Router.render('home', {to:'main'})

Template.home.events
  "click #signuphome": ->
    Session.set("login_overlay_on","true")
  "click #signuphome": ->
    Session.set("login_overlay_on","true")


Template.homecontent.helpers
  curUser: ->
    Meteor.user() == null
  person: ->
    Meteor.users.find().fetch()

Template.workerBio.helpers
  about:->
    Meteor.call('getabout',this._id)