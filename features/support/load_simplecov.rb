require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/controllers/application_controller.rb'
end