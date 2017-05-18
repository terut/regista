module Regista
  class RegistaError < StandardError
  end

  class ResourceError < RegistaError
  end

  class ResourceInvalid < ResourceError
  end
end
