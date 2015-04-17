express = require 'express'
port = process.env.PORT || 3000
app = express()

app.set 'views', './views'
app.set 'view engine', 'jade'
app.listen port

# index page
app.get '/' ,(req, res)->
	res.render 'index', {
		title: 'NodeTest 首页'
	}
# detail page
app.get '/movie/:id' ,(req, res)->
	res.render 'detail', {
		title: 'NodeTest 详情页'
	}
# admin page
app.get '/admin' ,(req, res)->
	res.render 'admin', {
		title: 'NodeTest 后台录入页'
	}
# list page
app.get '/list' ,(req, res)->
	res.render 'list', {
		title: 'NodeTest 列表页'
	}