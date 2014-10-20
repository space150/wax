# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
css_dir = "public/stylesheets"
sass_dir = "public/scss"
images_dir = "public/images"
fonts_dir = "public/fonts"
javascripts_dir = "public/javascripts"
generated_images_dir = "public/images/compass-sprites"

output_style = :expanded
if environment == :production
  output_style = :compressed
  line_comments = false
end

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# Remove cache-busting for Compass sprites
#  - Make a copy of sprites with a name that has no uniqueness of the hash.
on_sprite_saved do |filename|
  if File.exists?(filename)
    FileUtils.cp filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
    # Note: Compass outputs both with and without random hash images.
    # To not keep the one with hash, add: (Thanks to RaphaelDDL for this)
    FileUtils.rm_rf(filename)
  end
end

#  - Replace in stylesheets generated references to sprites
#  - by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
  if File.exists?(filename)
    css = File.read filename
    File.open(filename, 'w+') do |f|
      f << css.gsub(%r{-s[a-z0-9]{10}\.png}, '.png')
    end
  end
end
