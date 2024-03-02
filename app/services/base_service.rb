# frozen_string_literal: true

module BaseService
  module ClassMethods
    def call(*)
      new(*).call
    end
  end

  def self.prepended(klass)
    klass.extend ClassMethods
    klass.extend Dry::Initializer
  end

  def call(*args)
    super

    self
  end
end
