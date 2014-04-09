class Router extends Backbone.Router
  routes:
    '': 'open_page'
  open_page: ->
    page_name = Backbone.history.getFragment()
    page_name = 'index' if page_name is ''
    Backbone.Mediator.pub 'page:open', page_name

class Layout extends Backbone.View
  elements: page: ".layout-page"
  subscriptions: 'page:open': 'open_page'
  open_page: (page_name)->
    try Page = require "views/#{ page_name }"
    @$page.html new Page().render().el if Page

class Application
  constructor: ->
    @routes = new Router()
    @layout = new Layout(el: $("body"))
    Backbone.history.start pushState: yes, trigger: yes

module.exports = do ->
  $ -> new Application()
