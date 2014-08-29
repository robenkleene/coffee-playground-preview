LivePreviewView = require '../../live-preview/lib/live-preview-view' # TODO Package Live Preview

module.exports =
class CoffeePlaygroundView extends LivePreviewView
  getTitle: ->
    if @editor?
      "#{@editor.getTitle()} Playground"
    else
      "Coffee Playground"

  resolveRenderer: =>
    @renderer = require './coffee-playground-renderer'

  getLiveUpdateConfig: ->
    atom.config.get 'coffee-playground-preview.liveUpdate'
