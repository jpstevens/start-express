express = require 'express'

module.exports = (options) ->

  # init app
  app = express()

  # set options
  app.set key, option for key, config.option of options

  # require routers
  require(config.router || './routers')(app)

  # add HTTP to services if not in test mode
  options.services.unshift 'http' unless process.env.NODE_ENV is 'test'

  require('start-express-loader').start(app, services)

  app
