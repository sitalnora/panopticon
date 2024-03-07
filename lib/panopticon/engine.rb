module Panopticon
  class Engine < ::Rails::Engine
    isolate_namespace Panopticon

    def self.my_method
      raise StandardError, 'Something went wrong hehe.'
    end
  end
end
