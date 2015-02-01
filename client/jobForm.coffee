Template.easyJobCreation.events
  "click #submitJob": ->
    console.log(1)
    desc = $("#WorkDescription").val()
    num = $("#Number").val()
    comp = $("#Compensation").val()
    date = $("#Date").val()
    loc = $("#Location").val()
    console.log(desc)
    console.log(this)

    jobsList.insert(
      Description: desc
      Status: "Offered"
      Amount: comp
      DateAndTime: date
      location: loc
      Owner: Meteor.userId()
      OfferedTo: this.to
    )
    Meteor.call('updatePhone', Meteor.userId(), num)
    console.log(this.to)
    alert("Thank you! We will let you know when we hear back from " + Meteor.users.findOne({_id:this.to}).profile.name)
    $(".navbar-brand").click()