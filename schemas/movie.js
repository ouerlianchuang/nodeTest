
//模式
var mongoose = require('mongoose')

var MovieSchema = new mongoose.Schema({
    doctor: String,
    title: String,
    language: String,
    country: String,
    summary: String,
    flash: String,
    poster: String,
    year: Number,
    meta: {
        creatAt: {
            type: Date,
            default: Date.now()
        },
        updataAt:{
            type: Date,
            default: Date.now()
        }
    }
})

MovieSchema.pre('save', function(next){
    if (this.isNew){
        this.meta.creatAt = this.meta.updataAt = Date.now()
    }
    else {
        this.meta.updataAt = Date.mow()
    }
    next()
})

MovieSchema.statics = {
    fetch: function(cb) {
        return this
            .find({})
            .sort('meta.updateAt')
            .exec(cb)
    },
    findById: function(id, cb){
        return this
            .findOne({_id: id})
            .exec(cb)
    }
}

module.exports = MovieSchema




