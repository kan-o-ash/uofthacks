if(Meteor.isClient){

Template.workOffer.events({
    'submit form': function(event){

        // Prevent the browser from applying default behaviour to the form

        // Get the value from the "playerName" text field
        idVar = event.target.primary.value;

        // Call a Meteor method and pass through a name
        //Meteor.call('insertPlayerData', playerNameVar);

    }
  });

}