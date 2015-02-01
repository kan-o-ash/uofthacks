if Meteor.isClient
  Meteor.startup ->
    HomeController.render('homecontent', {to:'main'})
  