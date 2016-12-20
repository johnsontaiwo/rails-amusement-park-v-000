rails g migration AddAdminToUsers admin:boolean default:false --no-test-framework
require 'spec_helper'
require 'capybara/rails'