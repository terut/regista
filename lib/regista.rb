require 'rack'
require 'erb'

require "regista/version"
require "regista/configuration"
require "regista/dispatcher"
require "regista/app"
require "regista/resource"
require "regista/errors"

module Regista
  include Configurable

  def self.root
    @root ||= Pathname.new(File.expand_path("#{File.dirname(__FILE__)}/../")).freeze
  end

  def self.views
    @views ||= Pathname.new("#{root}/app/views").freeze
  end
end
