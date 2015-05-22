express = require 'express' #express模块
path = require 'path' # path 处理路径
mongoose = require 'mongoose' #mongo模块
_ = require 'underscore'  # 字段替换模块
Movie = require './models/movie' #mongodb
bodyParser = require 'body-parser' #
port = process.env.PORT || 3000 #端口
app = express() #实例

mongoose.connect 'mongodb://localhost/nodetest'
console.log 1
app.set 'views', './views/pages' #定义视图文件根目录
app.set 'view engine', 'jade' #定义默认模板
app.use bodyParser.urlencoded({extended: true}) #可以接受页面数据 并格式化req.body.movie
app.use express.static  path.join __dirname, 'public' #定义 样式 js 的目录 静态资源获取 __dirname= 当前目录
app.locals.moment = require 'moment'
app.listen port

# index page.json
app.get '/' ,(req, res)-> #response 应答
    Movie.fetch (err, movies)-> #调用 模式movie的fetch 取出所有数据
        if err
            console.log err
        res.render 'index',
            title: 'NodeTest 首页'
            movies: movies

# detail page
app.get '/movie/:id' ,(req, res)->
    id = req.params.id

    Movie.findById id, (err, movie)->
        if err
            console.log 123
            console.log err

        res.render 'detail',
            title: "NodeTest #{movie.title} 详情页"
            movie: movie

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


# admin update movie
app.get '/admin/update/:id', (req,res)->
    id = req.params.id

    if id
        Movie.findById id, (err, movie)->
            if err
                console.log 123
                console.log err
            res.render 'admin',
                title: 'NodeTest 后台更新页'
                movie: movie

# admin post movie
app.post '/admin/movie/new', (req, res)->
    id = req.body.movie._id
    movieObj = req.body.movie

    if id isnt 'undefined'
        Movie.findById id, (err, movie)->
            if err
                console.log err

            _movie = _.extend movie, movieObj # 新字段替换掉老字段
            _movie.save (err, movie)->
                if err
                    console.log err

                res.redirect "/movie/#{movie._id}" #页面重定向
    else
        _movie = new Movie
            doctor : movieObj.doctor
            title : movieObj.title
            country : movieObj.country
            language : movieObj.language
            year : movieObj.year
            poster : movieObj.poster
            summary : movieObj.summary
            flash : movieObj.flash
        _movie.save (err, movie)->
            if err
                console.log err

            res.redirect "/movie/#{movie._id}"


# list page
app.get '/admin/list' ,(req, res)->
    Movie.fetch (err, movies)->
        if err
            console.log err

        res.render 'list',
            title: 'NodeTest 列表页'
            movies: movies
#list delete movie
app.delete '/admin/list', (req, res)->
    id = req.query.id
    if id
        Movie.remove {_id: id}, (err,movie)->
            if err
                console.log err
            else
                res.json {success: 1}




