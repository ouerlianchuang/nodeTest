// Generated by CoffeeScript 1.9.2
(function() {
  var app, express, port;

  express = require('express');

  port = process.env.PORT || 3000;

  app = express();

  app.set('views', './views');

  app.set('view engine', 'jade');

  app.listen(port);

  app.get('/', function(req, res) {
    return res.render('index', {
      title: 'NodeTest 首页'
    });
  });

  app.get('/movie/:id', function(req, res) {
    return res.render('detail', {
      title: 'NodeTest 详情页'
    });
  });

  app.get('/admin', function(req, res) {
    return res.render('admin', {
      title: 'NodeTest 后台录入页'
    });
  });

  app.get('/list', function(req, res) {
    return res.render('list', {
      title: 'NodeTest 列表页'
    });
  });

}).call(this);
