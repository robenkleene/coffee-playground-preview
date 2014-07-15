LivePreview = require './live-preview'

module.exports =
class CoffeeScriptPlaygroundPreview extends LivePreview
  @getPackageName: ->
    'coffeescript-playground-preview'
