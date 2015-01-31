if Meteor.isClient

  Meteor.startup ->
    # Accounts.ui.config
    #   requestPermissions:
    #     facebook: ["user_likes"]
    #     github: [
    #       "user"
    #       "repo"
    #     ]

    #   requestOfflineToken:
    #     google: true

    #   passwordSignupFields: "USERNAME_AND_OPTIONAL_EMAIL"
    return

  Template.viewMgr.helpers
    view: ->
      return Session.get("view")

  Template.home.events
    "click button": ->
      num = $("#phonenum").val()
      test = Meteor.call("sendSMS", num)
      console.log(test)

  
  # counter starts at 0
  Session.setDefault "counter", 0

  Accounts.ui.config
    requestPermissions:
      facebook: [
        "email"
        "user_friends"
        "user_location"
      ]