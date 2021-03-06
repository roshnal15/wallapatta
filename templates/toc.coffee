VERSION = 9

Weya = require '../lib//weya/weya'

template = ->
 @html ->
  @head ->
   @meta charset: "utf-8"
   @title "Wallapatta"
   @meta name: "viewport", content: "width=device-width, initial-scale=1.0"
   @meta name: "apple-mobile-web-app-capable", content:"yes"
   @link
    href: 'http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
    rel: 'stylesheet'
    type: 'text/css'
   @link href: "lib/skeleton/css/skeleton.css", rel: "stylesheet"
   @link href: "css/style.css", rel: "stylesheet"
   @script '''
     (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
     (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
     m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
     })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

     ga('create', 'UA-37809145-1', 'auto');
     ga('send', 'pageview');
   '''

  @body ->
   @div ".container", ->
    @h1 @$.title
    @div ".toc", "###TOC###"

exports.html = (options) ->
 html = Weya.markup context: options, template

 html = html.replace '###TOC###', options.toc

 html = "<!DOCTYPE html>#{html}"

 return html

render = (options, elem) ->
 ol = null

 Weya elem: elem, ->
  @li ->
   if options.file?
    @a href: "#{options.id}.html", options.title
   else
    @span options.title

   if options.content?
    ol = @ol null

 if options.content?
  for i in options.content
   render i, ol

exports.render = (options, elem) ->
 ol = null
 Weya elem: elem, ->
  ol = @ol null

 for i in options
  render i, ol

