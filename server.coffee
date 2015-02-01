if Meteor.isServer
  Meteor.startup ->
    return
  accountSid = "AC8ca77fff4937cd2163da438b963717c9"
  authToken = "f2b35f8e684ea383dc806dacee18d806"
  client = Meteor.npmRequire("twilio")(accountSid, authToken)
  Meteor.methods
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

