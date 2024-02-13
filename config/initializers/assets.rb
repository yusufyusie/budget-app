# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# config/initializers/assets.rb

Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images')
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( stimulus.min.js )
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( application.js controllers/application.js )
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( @popperjs--core.js controllers/hello_controller.js )
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( currency.svg application.css )
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( stimulus-loading.js controllers/index.js )
# config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( application.js turbo.min.js currency.svg stimulus-loading.js controllers/hello_controller.js controllers/application.js )

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
