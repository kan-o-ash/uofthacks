jobsList = new Mongo.Collection('jobs');

if(Meteor.isServer){
    Meteor.startup(function() {
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "ash",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "Bryan Chu",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "worker2",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "worker2",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "worker3",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
        jobsList.insert({
            Owner: "Alex MacLean",
            Title: "Leaves",
            Status: "Offered",
            OfferedTo: "worker3",
            Description: "Need some leaves raked.",
            Amount: "$50",
            DateAndTime: "02/3/2015, 4pm"
        });
    });
}