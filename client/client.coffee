Meteor.subscribe("currentUserData")

Meteor.startup ->
  # Router.render('home', {to:'main'})

Template.home.events
  "click #signuphome": ->
    Session.set("login_overlay_on","true")
  "click #signuphome": ->
    Session.set("login_overlay_on","true")

Template.topBar.helpers
  userid:->
    Meteor.user()._id

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
    jobsList.find({'OfferedTo': Meteor.user().name,'Status':'Offered'}).fetch()

Template.workOffer.events
  "click .btn-accept": ->
    jobsList.update({'_id':this._id},{$set:{'Status':'Accepted'}})
    console.log(this._id)

  "click .btn-decline": ->
    jobsList.remove(this._id)
    console.log(this._id)

Template.acceptedJobs.helpers
  accepted: ->
    jobsList.find({'OfferedTo': Meteor.user().profile.name,'Status':'Accepted'}).fetch()  