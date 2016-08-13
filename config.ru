require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# 'use Rack::MethodOverride' provides ability to send patch and delete requests!
use Rack::MethodOverride
run ApplicationController
