express = require 'express'
path = require 'path'
bodyParser = require 'body-parser'
port = process.env.PORT || 3000
app = express()

app.set 'views', './views/pages'
app.set 'view engine', 'jade'
app.use bodyParser.json()
app.use express.static  path.join __dirname, 'bower_components'
app.listen port

# index page.json
app.get '/' ,(req, res)->
    res.render 'index',
        title: 'NodeTest 首页'
        movies: [
            title: '机械战警'
            _id: 1
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ,
            title: '机械战警'
            _id: 2
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ,
            title: '机械战警'
            _id: 3
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ,
            title: '机械战警'
            _id: 4
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ,
            title: '机械战警'
            _id: 5
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ,
            title: '机械战警'
            _id: 6
            poster: 'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
        ]

# detail page
app.get '/movie/:id' ,(req, res)->
    res.render 'detail',
        title: 'NodeTest 详情页'
        movie:
            title: '机械战警'
            _id: 1
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
# admin page
app.get '/admin/movie' ,(req, res)->
    res.render 'admin',
        title: 'NodeTest 后台录入页'
        movie:
            title: ''
            doctor: ''
            country: ''
            year: ''
            poster: ''
            flash: ''
            summary: ''
            language: ''

# list page
app.get '/admin/list' ,(req, res)->
    res.render 'list',
        title: 'NodeTest 列表页'
        movies: [
            title: '机械战警'
            _id: 1
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ,
            title: '机械战警'
            _id: 2
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ,
            title: '机械战警'
            _id: 3
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ,
            title: '机械战警'
            _id: 4
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ,
            title: '机械战警'
            _id: 5
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ,
            title: '机械战警'
            _id: 6
            doctor: '何塞。派蒂利亚'
            country: '美国'
            year: 2014
            poster:'http://r3.ykimg.com/05160000530EEB63675839160D0B79D5'
            language: '英语'
            flash: 'http://player.youku.com/player.php/sid/XNjA1Njc0NTUy/v.swf'
            summary: '这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简
            介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介这是简介'
        ]
