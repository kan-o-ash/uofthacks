MessageList = new Mongo.Collection('messages')

if Meteor.isServer
  Meteor.startup ->
    return

  Meteor.publish "currentUserData", ->
    Meteor.users.find {},
      fields:
        about: 1,
        services: 1,
        name: 1
        number: 1

  accountSid = "AC8ca77fff4937cd2163da438b963717c9"
  authToken = "f2b35f8e684ea383dc806dacee18d806"
  client = Meteor.npmRequire("twilio")(accountSid, authToken)

  Meteor.methods
    getName: (id) ->
      return Meteor.users.findOne({_id:id}).profile.name

    updatePhone: (id, num) ->
      if num
        Meteor.users.update
          _id: id
        ,
          $set:
            number: num

    getabout: (id) ->
      return Meteor.users.findOne({_id:id}).about

    sendSMS: (number, message_cont) ->
      # Your accountSid and authToken from twilio.com/user/account
      client.messages.create
        body: message_cont
        
        #insert the number of the employee
        to: number
        from: "+14387937708"
      , (err, message) ->
        console.log message
        return
      console.log message
      MessageList.insert(
        from_num: "+14387937708"
        to_num: number
        content: message_cont
      )

    sendSMSDeclined: (client_id, offering_id) ->
      # Your offer was declined
      # who declined?
      declined_by = Meteor.users.find({_id:offering_id}).name
      number = Meteor.users.find({_id:client_id}).number
      return number
      message_content = "Your offer was declined by " + declined_by + ". Sorry! We hope your next offer is accepted."
      client.messages.create
        body: message_cont
        
        #insert the number of the employee
        to: number
        from: "+14387937708"
      , (err, message) ->
        console.log message
        return
      console.log message
      MessageList.insert(
        from_num: "+14387937708"
        to_num: number
        content: message_cont
      )

    sendSMSAccepted: (client_id, offering_id) ->
      # Your offer was accepted 
      # offer_name -> who accepted, accepted 
      accepted_by_num = Meteor.users.find({_id:offering_id}).number
      accepted_by = Meteor.users.find({_id:offering_id}).name
      message_content = "Your offer was accepted! by " + accepted_by + "! You can contact them at " + accepted_by_num + " :)"
      Meteor.call('sendSMS', number, message_content)

    sendSMSYouAccepted: (offering_id, client_id) ->
      # You accepted, here is the other person's name and number
      client_num = Meteor.users.find({_id:client_id}).number
      client_name = Meteor.users.find({_id:client_id}).name
      message_content = "You accepted " + client_name + "'s offer! You can reach them at " + client_num + " :)"
      Meteor.call('sendSMS', number, message_content)

    smsmethod: ->
      resp = new client.TwimlResponse()
      resp.say "Welcome to Twilio!"
      resp.say "Please let us know iyooooooooooo",
        voice: "woman"
        language: "en-gb"

      console.log resp.toString()