module Regista
  module Resource
    class Base
      class << self
        def find(*arguments)
          action = arguments.slice!(0)
          params = arguments.slice!(0) || {}
          attrs = fetch(action, params)
          resource = instantiate_resource(attrs)
          resource.validate!
          resource
        end

        def fetch(action, params)
          raise NotImplementedError
        end

        private

          def instantiate_resource(attrs)
            new(attrs)
          end
      end

      attr_reader :title, :description, :image

      def initialize(attrs)
        @title = attrs[:title]
        @description = attrs[:description]
        @image = attrs[:image]
      end

      def validate!
        raise ResourceInvalid if blank?(title)
      end

      def blank?(val)
        val.nil? || (val.respond_to?(:strip) ? val.strip.empty? : val.empty?)
      end
    end

    class Null < Base
      def self.fetch(action, params)
        { title: "Regista", image: "https://placehold.it/740x640" }
      end
    end
  end
end
