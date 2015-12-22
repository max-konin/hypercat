# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/puma'
require 'capistrano/puma/workers'
require 'capistrano/puma/nginx'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/assets'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
