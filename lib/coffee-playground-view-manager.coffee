LivePreviewViewManager = require '../../live-preview/lib/live-preview-view-manager'

module.exports =
class CoffeePlaygroundViewManager extends LivePreviewViewManager
  resolvePreviewView: =>
    @PreviewView ?= require './coffee-playground-view'
