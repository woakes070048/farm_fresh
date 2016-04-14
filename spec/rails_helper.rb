require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/controllers/application_controller.rb'
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'rack_session_access/capybara'
require 'support/geocoder'
require 'support/omniauth_test_helper'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :view
  config.include OmniAuthTestHelper, type: :controller
end

def create_helper_objects

  @category = Category.create(name: "Eggs")
  @child_category = Category.create(name: "Chicken Eggs", parent: @category)

  if Farm.find_by(email: "1@1.com").nil?
    @farm = Farm.create(name: "BROOMFIELDS FARM SHOP", email: "1@1.com", password: "12345678", password_confirmation: "12345678", street: "School Plantation, ", city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire", remote_logo_url: "https://unsplash.it/100/100/?random")
  else
    @farm = Farm.find_by(email: "1@1.com")
  end

  @eggs = Item.create(name: 'Eggs', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs1', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs2', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs3', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs4', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs5', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs6', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs7', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs8', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs9', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs10', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs11', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs12', price: 0.20, quantity: 500, category: @category, farm: @farm)
  Item.create(name: 'Eggs13', price: 0.20, quantity: 500, category: @category, farm: @farm)

  @eggs.images.create(remote_image_url: "https://upload.wikimedia.org/wikipedia/commons/e/ee/Egg_colours.jpg")
  @eggs.save

  if Restaurant.find_by(email: "1@2.com").nil?
    @restaurant1 = Restaurant.create(name: "BROOMFIELDS FARM SHOP", email: "1@2.com", password: "12345678", password_confirmation: "12345678", street: "School Plantation, ", city: "Worcester", post_code: "WR6 6NF", region: "Worcestershire", remote_logo_url: "https://unsplash.it/100/100/?random")
  else
    @restaurant1 = Restaurant.find_by(email: "1@2.com")
  end

  DeliveryOption.create(name: "1st Class", price: 2.99)

  Status.destroy_all
  @in_progress_status = Status.create(name: "In Progress")

  @order = Order.new(restaurant: @restaurant1,
                     delivery_option: DeliveryOption.first,
                     status: @in_progress_status)



  @line_item1 = @order.line_items.build(item: @eggs, quantity: 200)


end

def create_multiple_orders
  @in_progress_status = Status.find_by(name: "In Progress")
  unshipped_status = Status.create(name: "Unshipped")
  @restaurant1 = Restaurant.find_by(email: "1@2.com")

  @restaurant1.basket_items.create(item: Item.first, quantity: 20)
  @restaurant1.basket_items.create(item: Item.last, quantity: 30)

  order1 = @restaurant1.orders.create(vat: 20, delivery_option: DeliveryOption.first)
  @restaurant1.basket_items.each do |basket_item|
    order1.line_items.build(item_id: basket_item.item_id, quantity: basket_item.quantity,
                            status: unshipped_status)
  end
  order1.save


  @restaurant1.basket_items.create(item: Item.first, quantity: 10)
  @restaurant1.basket_items.create(item: Item.last, quantity: 10)

  order2 = @restaurant1.orders.create(vat: 20, delivery_option: DeliveryOption.first)
  @restaurant1.basket_items.each do |basket_item|
    order2.line_items.build(item_id: basket_item.item_id, quantity: basket_item.quantity,
                            status: unshipped_status)
  end
  order2.created_at = Date.yesterday
  order2.save

end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.example_status_persistence_file_path = "spec/support/examples.txt"
end
