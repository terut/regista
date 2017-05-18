require 'rack'

require "regista/version"
require "regista/dispatcher"
require "regista/app"
require "regista/resource"
require "regista/errors"

module Regista
  def self.root
    @root ||= Pathname.new(File.expand_path("#{File.dirname(__FILE__)}/../")).freeze
  end

  def self.views
    @views ||= Pathname.new("#{root}/app/views").freeze
  end
end
