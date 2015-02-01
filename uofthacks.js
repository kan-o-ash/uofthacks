Router.route('/', function () {
	this.layout('appLayout');
  this.render('Home');
});


Router.route('/login', function () {
	this.layout('appLayout');
  this.render('home', {to: 'main'});
  this.render('login', {to: 'overlay'});
});
