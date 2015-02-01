if Meteor.isServer
  Meteor.startup ->
    return

  Meteor.publish "currentUserData", ->
    Meteor.users.find {},
      fields:
        about: 1,
        services: 1

  accountSid = "AC8ca77fff4937cd2163da438b963717c9"
  authToken = "f2b35f8e684ea383dc806dacee18d806"
  client = Meteor.npmRequire("twilio")(accountSid, authToken)

  Meteor.methods
    getabout: (id) ->
      return Meteor.users.findOne({_id:id}).about
    sendSMS: (number) ->
      # Your accountSid and authToken from twilio.com/user/account
      client.messages.create
        body: "YOOOOOOOOOO"
        
        #insert the number of the employee
        to: number
        from: "+14387937708"
      , (err, message) ->
        console.log message
        return

    smsmethod: ->

      resp = new client.TwimlResponse()
      resp.say "Welcome to Twilio!"
      resp.say "Please let us know iyooooooooooo",
        voice: "woman"
        language: "en-gb"

      console.log resp.toString()