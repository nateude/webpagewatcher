# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/rails/assets' # for asset handling add
require 'capistrano/rails/migrations' # for running migrations
require 'capistrano/puma'
require 'capistrano/puma/nginx'
install_plugin Capistrano::Puma
require 'capistrano/rails/console'
require 'capistrano/rails/logs'
require 'capistrano/rake'
require 'capistrano/console'

require 'capistrano/rails/console'
require 'capistrano/rails/logs'
require 'capistrano/rake'
require 'capistrano/console'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
