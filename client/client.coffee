if (Meteor.isClient)

  Template.home.events
    "click #fegagabutton": ->
      num = $("#phonenum").val()
      test = Meteor.call("sendSMS", num)
      console.log(test)
    
    "click #signuphome": ->
      Template.viewMgr.showOverlay("login")
  
    "click #signuphelp": ->
      Template.viewMgr.showOverlay("login")

  Template.workOffer.helpers
    curoffers: ->
      jobsList.find({'OfferedTo': Meteor.user().profile.name}).fetch()


  Template.workOffer.events
    "click .btn-accept": ->
      console.log(this._id)

    "click .btn-decline": ->
      jobsList.remove(this._id)
      console.log(this._id)