module Regista
  class RegistaError < StandardError
  end

  class ConfigurationError < RegistaError
    def initialize(invalid_keys = [])
      super("Configure the options: #{invalid_keys}")
    end
  end

  class ResourceError < RegistaError
  end

  class ResourceInvalid < ResourceError
  end

  class ResourceNotFound < ResourceError
  end
end
