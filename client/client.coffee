Meteor.subscribe("currentUserData")

Meteor.startup ->
  # Router.render('home', {to:'main'})
  # Meteor.call('sendSMS', '+16477090734', 'sup')

Template.home.events
  "click #signuphome": ->
    $("#login-sign-in-link").click()
  "click #signuphelp": ->
    $("#login-sign-in-link").click()

Template.topBar.helpers
  userid:->
    return Meteor.userId()

Template.homecontent.helpers
  curUser: ->
    Meteor.user() == null
  person: ->
    Meteor.users.find().fetch()

Template.workerBio.helpers
  about:->
    Meteor.call('getabout',this._id)
  myuserid:->
    Meteor.user()._id
    


Template.workOffer.helpers
  curoffers: ->
    jobsList.find({'OfferedTo': Meteor.userId(),'Status':'Offered'}).fetch()

  jobowner: ->
    Meteor.call('getName', this.Owner)

  picture: ->
    id = this.Owner
    owner_fb_id = Meteor.users.findOne(_id:id).services.facebook.id
    return "https://graph.facebook.com/" + owner_fb_id + "/picture?type=large"


Template.workOffer.events
  "click .btn-accept": ->
    jobsList.update({'_id':this._id},{$set:{'Status':'Accepted'}})
    console.log(this._id)
    offering_id = Meteor.userId()
    offering_num = Meteor.user().number
    Meteor.call("sendSMS", client_id, offering_id)
    Meteor.call("sendSMSAccepted", client_id, offering_id)
    Meteor.call("sendSMSYouAccepted", offering_id, client_id)

  "click .btn-decline": ->
    jobsList.remove(this._id)
    console.log(this._id)

    offering_id = Meteor.userId()
    client_id = this.Owner
    Meteor.call("sendSMS", Meteor.users.findOne({_id:'BEdgJcKqtKBsDgyBf'}).number , 'it fully worked')
    # Meteor.call("sendSMSDeclined", client_id, offering_id)

Template.acceptedJobs.helpers
  accepted: ->
    jobsList.find({'OfferedTo': Meteor.user().profile.name,'Status':'Accepted'}).fetch()  