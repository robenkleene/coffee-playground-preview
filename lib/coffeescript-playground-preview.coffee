# TODO: Move LivePreview to a dependency
LivePreview = require '../../live-preview/lib/live-preview'

module.exports =
class CoffeeScriptPlaygroundPreview extends LivePreview
  @getPackageName: ->
    'coffeescript-playground-preview'
