source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Slick slider
gem "jquery-slick-rails"
# Font-awesome
gem "font-awesome-rails"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Ransack (search)
gem 'ransack', '~> 1.8', '>= 1.8.2'
# jquery-file-upload
gem 'jquery-fileupload-rails', '~> 0.4.7'
# Shrine
gem 'shrine', '~> 2.5'
# AWS
gem 'aws-sdk', '~> 2.9', '>= 2.9.15'
# Roda for pre-signed keys
gem 'roda', '~> 2.25'
# image_processing
gem 'image_processing', '~> 0.4.1'
# mini_magick
gem 'mini_magick', '~> 4.6', '>= 4.6.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# jquery UI
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Pagination
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 0.0.11'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker', '~> 1.7', '>= 1.7.3'
end

group :test do
  gem 'minitest-reporters', '~> 1.1', '>= 1.1.14'
  gem 'guard', '~> 2.14', '>= 2.14.1'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.6'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.1'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
