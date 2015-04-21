express = require 'express'
path = require 'path'
mongoose = require 'mongoose'
_ = require 'underscore'
Movie = require './models/movie'
bodyParser = require 'body-parser'
port = process.env.PORT || 3000
app = express()

mongoose.connect 'mongodb://localhost/nodetest'

app.set 'views', './views/pages'
app.set 'view engine', 'jade'
app.use bodyParser.urlencoded({extended: true})
app.use express.static  path.join __dirname, 'bower_components'
app.listen port

# index page.json
app.get '/' ,(req, res)->
    Movie.fetch (err, movies)->
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
            res.render 'admin',
                title: 'NodeTest 后台更新页'
                movie: movie

# admin post movie
app.post '/admin/movie/new', (req, res)->
    console.log req
    id = req.body.movie._id
    movieObj = req.body.movie #晕

    if id isnt 'undefined'
        Movie.findById id, (err, movie)->
            if err
                console.log err

            _movie = _.extend movie, movieObj
            _movie.save (err, movie)->
                if err
                    console.log err

                res.redirect "/movie/#{movie._id}"
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

        res.render 'index',
            title: 'NodeTest 列表页'
            movies: movies
