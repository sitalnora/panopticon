module Panopticon
  class PanopticonController < ApplicationController
    def index
      @info = {}
      if File.exist?('../../memtemp.txt')
        File.readlines('../../memtemp.txt').map do |line|
          if line.present?
            controller, action, mem_usage = line.chomp.split('$')
            @info[controller] ||= {}
            @info[controller][action] ||= {}
            @info[controller][action][:mem_usage] ||= 0
            @info[controller][action][:count] ||= 0
            @info[controller][action][:max] ||= 0
            mem_usage = mem_usage.to_f

            @info[controller][action][:mem_usage] += mem_usage
            @info[controller][action][:count] += 1
            @info[controller][action][:max] = [@info[controller][action][:max], mem_usage].max
          end
        end
      end
    end
  end
end