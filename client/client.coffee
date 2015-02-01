  layout = new Iron.Layout(
    template: 'appLayout'
  )

  Meteor.startup ->

    layout.render('home', {to: 'main'})

    return

  Template.viewMgr.helpers
    view: (view) ->
      Session.get("view") is view     # returns true if view is this view

    overlay: (overlay) ->
      return false

  Template.viewMgr.goToView = (view) ->
    console.log(Router.current())
    Router.route('/login');

  Template.viewMgr.showOverlay = (overlay) ->
    Session.set('view', overlay)



  Template.home.events
    "click button": ->
      num = $("#phonenum").val()
      test = Meteor.call("sendSMS", num)
      console.log(test)
    
    "click #signuphome": ->
      Template.viewMgr.showOverlay("login")
  
    "click #signuphelp": ->
      Template.viewMgr.showOverlay("login")


  Accounts.ui.config
    requestPermissions:
      facebook: [
        "email"
        "user_friends"
        "user_location"
      ]