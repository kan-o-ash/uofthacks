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

      # ACCOUNT_SID = "AC2fac3c94332f5b98084c27c8711f7056"
      # AUTH_TOKEN = "e8a205ca436aac66986cb4a226c6f2eb"
      # twilio = Twilio(ACCOUNT_SID, AUTH_TOKEN)
      # return 3
      # twilio.sendSms
      #   to: "6477090734" # Any number Twilio can deliver to
      #   from: "+6476910589" # A number you bought from Twilio and can use for outbound communication
      #   body: "word to your mother." # body of the SMS message
      # , (err, responseData) -> #this function is executed when a response is received from Twilio
      #   unless err
      #     console.log responseData.from # outputs "+14506667788"
      #     console.log responseData.body # outputs "word to your mother."
      #     return responseData
      #   return err

