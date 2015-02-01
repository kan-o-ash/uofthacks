Router.route("/",{
  name:"home"
});

// Router.route("/", function() {
//     this.layout('defaultLayout');
//     this.render('home');
// });


Router.route("/offer",function() {
	this.layout('defaultLayout');
	this.render('offersPage', {to:'main'});
});

Router.route("/profile/:_id",function() {
    this.layout('defaultLayout');
    this.render('workerBio', {
        to:'main',
        data: function () {
            return Meteor.users.findOne({_id: this.params._id});
        },
       to: 'main'
     });


    // this.render('workerBio', {to:'main'});
});

Router.map(function() {
    this.route('methodExample', {
        path: '/sms',
        where: 'server',
        action: function() {
            // GET, POST, PUT, DELETE
            var requestMethod = this.request.method;
            // Data from a POST request
            var requestData = this.request.body;
            var num = this.request.From;
            // Could be, e.g. application/xml, etc.
            this.response.writeHead(200, {'Content-Type': 'text/xml'});
            this.response.end('<Response><Say>hello. We will text you your offering number</Say><Sms>hello. We will text you your offering number</Sms></Response>');
        }
    });
});