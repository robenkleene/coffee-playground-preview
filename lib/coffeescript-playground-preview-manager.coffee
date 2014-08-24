LivePreviewViewManager = require '../../live-preview/lib/live-preview-view-manager'

module.exports =
class CoffeescriptPlaygroundPreviewViewManager extends LivePreviewViewManager
  resolvePreviewView: =>
    @PreviewView ?= require './coffeescript-playground-preview-view'
