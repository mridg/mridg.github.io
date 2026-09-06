# frozen_string_literal: true

# Ruby 3.2+ compatibility patch for Jekyll 3.x
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end

    def taint
      self
    end

    def untaint
      self
    end
  end
end
