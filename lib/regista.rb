require 'rack'

require "regista/version"
require "regista/dispatcher"

module Regista
  def self.root
    @root ||= Pathname.new(File.expand_path("#{File.dirname(__FILE__)}/../")).freeze
  end

  def self.views
    @views ||= Pathname.new("#{root}/app/views/regista").freeze
  end
end
