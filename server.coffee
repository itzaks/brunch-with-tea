express = require 'express'
path = require 'path'

class Server
  constructor: ->
    #start on heroku
    @start() unless module.parent

  routes: ->
    @app.get '/', (req, res) ->
      res.render 'index.static.jade'

  start: ->
    @app = express()
    @routes()

    @app.use express.compress()
    @app.use express.bodyParser()
    @app.use express.static (path.resolve "public")
    @app.use express.logger 'dev'

    @app.set 'views', __dirname + '/app'
    @app.set 'view engine', 'jade'

    @app.listen 3333

module.exports = new Server()
