CoffeescriptPlaygroundPreviewViewManager = require './coffeescript-playground-preview-manager'

module.exports =
class CoffeescriptPlaygroundPreview

  @activate: =>
    @coffeescriptPlaygroundPreviewViewManager = new CoffeescriptPlaygroundPreviewViewManager('coffeescript-playground-preview:')

    atom.workspaceView.command 'coffeescript-playground-preview:toggle', =>
      @coffeescriptPlaygroundPreviewViewManager.togglePreview()
