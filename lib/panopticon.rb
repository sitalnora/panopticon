require "panopticon/engine"

module Panopticon
  def self.setup
    yield self
  end
end

require 'panopticon/controllers'
require 'get_process_mem'
require 'pry'