module Regista
  module Configurable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def config
        @configuration ||= Configuration.new
      end

      def configure
        yield(config)
      end
    end
  end

  class Configuration
    def self.default_options
      @default_options ||= {
        path: '/ul',
        fallback_title: nil,
        fallback_description: nil,
        fallback_image: nil,
        fallback_app_name: nil
      }
    end

    def initialize
      reset
    end

    def reset
      self.class.default_options.each do |k, v|
        instance_variable_set(:"@#{k}", v)
      end
    end

    def validate!
      required_options = [ :fallback_title, :fallback_app_name ]
      invalid_keys = required_options.select { |k| instance_variable_get(:"@#{k}").nil? }
      raise ConfigurationError.new(invalid_keys) if !invalid_keys.empty?
    end

    attr_accessor *default_options.keys
  end
end
