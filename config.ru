# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'bootstrap-sass'

require 'carrierwave/orm/activerecord'
#require 'font-awesome'
run Rails.application
