namespace :styleguide do
  desc "Build the styleguide to public/"
  task :build => ['wax:build'] do
    sh "cp wax/build/styleguide/index.html public/styleguide.html"
  end
end

namespace :wax do
  desc "Run wax build"
  task :build do
    sh "bundle exec wax build"
  end

  desc "Serve the wax build"
  task :server do
    require "webrick"

    mime_types = WEBrick::HTTPUtils::DefaultMimeTypes
    mime_types.store 'htc', 'text/x-component'
    WEBrick::HTTPServer.new(
      Port: ENV["PORT"] || 5432,
      DocumentRoot: File.join(Dir.pwd, "wax", "build"),
      BindAddress: "0.0.0.0",
      Logger: WEBrick::Log.new("/dev/null"),
      AccessLog: [],
      MimeTypes: mime_types
    ).start
  end
end

namespace :js do
  desc "Build the js templates"
  task :templates do
    templates = `./node_modules/.bin/hulk Views/Partials/*`
    templates = "#{templates};module.exports = templates;"
    File.write("./public/coffee/templates/index.js", templates)
  end

  desc "Build the js for the site"
  task :build do
    sh "./node_modules/.bin/browserify --extension=\".coffee\" -t coffeeify -t stripify -t uglifyify public/coffee/application.coffee -o public/javascripts/application.js"
  end

  desc "Run watchify to develop js"
  task :dev do
    sh "./node_modules/.bin/watchify --extension=\".coffee\" -t coffeeify public/coffee/application.coffee -dvo public/javascripts/application.js"
  end
end

desc "Generate coffescript documentation"
task :docs do
  sh "rm -rf docs/*"
  sh "./node_modules/.bin/docco public/coffee/*.coffee -o docs/"
end
