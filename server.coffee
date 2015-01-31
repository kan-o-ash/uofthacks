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

  
  # counter starts at 0
  Session.setDefault "counter", 0
  # Template.hello.helpers counter: ->
  #   Session.get "counter"

  # Template.hello.events "click button": ->
    
  #   # increment the counter when button is clicked
  #   Session.set "counter", Session.get("counter") + 1
  #   return
  Accounts.ui.config requestPermissions:
    facebook: [
      "email"
      "user_friends"
      "user_location"
      "user_events"
      "friends_events"
      "friends_location"
      "friends_about_me"
      "user_status"
      "friends_status"
      "read_friendlists"
    ]

if Meteor.isServer
  Meteor.startup ->


# code to run on server at startup