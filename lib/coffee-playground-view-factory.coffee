global.previewView = null

exports.getPreviewView = ->
  global.PreviewView ?= require './coffee-playground-view'
  return global.PreviewView
