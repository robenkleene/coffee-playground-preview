LivePreviewViewManager = require '../../live-preview/lib/live-preview-view-manager'
CoffeePlaygroundViewFactory = require './coffee-playground-view-factory'

deserializer =
  name: 'CoffeePlaygroundView'
  deserialize: (state) ->
    if state.constructor is Object
      CoffeePlaygroundView = CoffeePlaygroundViewFactory.getPreviewView()
      uri = state.uri
      new CoffeePlaygroundView(uri)
atom.deserializers.add(deserializer)

module.exports =
class CoffeePlaygroundPreview
  @configDefaults:
    liveUpdate: true

  @activate: =>
    @livePreviewViewManager = new LivePreviewViewManager('coffee-playground:', CoffeePlaygroundViewFactory)

    atom.workspaceView.command 'coffee-playground-preview:toggle', =>
      @livePreviewViewManager.togglePreview()
