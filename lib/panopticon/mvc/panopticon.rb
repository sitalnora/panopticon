# frozen_string_literal: true

ActiveSupport.on_load(:action_controller_base) do
  extend Panopticon::Controllers
end