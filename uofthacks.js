appController = RouteController.extend();

Router.route('/', function () {
  this.render('home');
});


Router.route('/login', function () {
	this.layout('appLayout');
  this.render('home', {to: 'main'});
  this.render('login', {to: 'overlay'});
});


Router.route('/sms-response', function () {
	this.render('smsResp');
});