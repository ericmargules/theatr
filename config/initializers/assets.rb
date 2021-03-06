# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( order.js )
Rails.application.config.assets.precompile += %w( root.js )
Rails.application.config.assets.precompile += %w( admin.js )
Rails.application.config.assets.precompile += %w( now_showing.js )
Rails.application.config.assets.precompile += %w( showtime.js )
Rails.application.config.assets.precompile += %w( owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( order.css )
Rails.application.config.assets.precompile += %w( theatr.css )
Rails.application.config.assets.precompile += %w( owl.carousel.min.css )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
