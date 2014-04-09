exports.config =
  # See http://brunch.io/#documentation for docs.
  plugins: static_jade: extension: '.static.jade'
  files:
    javascripts:
      joinTo:
        'app.js': /^app/
        'vendor.js': /^(?!app)/
      order: before: [
          'vendor/javascript/jquery-1.10.2.js',
          'vendor/javascript/underscore-min.js',
          'vendor/javascript/auto-reload.js'
          'vendor/javascript/backbone-min.js'
        ]
    stylesheets:
      joinTo: 'app.css'
    templates:
      joinTo: 'app.js'
