module Regista
  class RegistaError < StandardError
  end

  class ResourceError < RegistaError
  end

  class ResourceInvalid < ResourceError
  end

  class ResourceNotFound < ResourceError
  end
end
