source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'slim'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'gon'

gem 'pry-rails'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'rspec-power_assert'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
end
