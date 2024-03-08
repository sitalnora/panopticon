module Panopticon
  class MemoryWatcherController < ApplicationController
    def index
      @info = {}
      if File.exist?('../../memtemp.txt')
        File.readlines('../../memtemp.txt').map do |line|
          if line.present?
            controller, action, mem_usage = line.chomp.split('$')
            hash_key = "#{controller}##{action}"
            @info[hash_key] ||= {}
            @info[hash_key] ||= {}
            @info[hash_key][:mem_usage] ||= 0
            @info[hash_key][:count] ||= 0
            @info[hash_key][:max] ||= 0
            mem_usage = mem_usage.to_f

            @info[hash_key][:mem_usage] += mem_usage
            @info[hash_key][:count] += 1
            @info[hash_key][:max] = [@info[hash_key][:max], mem_usage].max
          end
        end
      end
    end

    def analysis
      @info = []
      if File.exist?('../../memtemp.txt')
        File.readlines('../../memtemp.txt').map do |line|
          if line.include?(params[:inquiry])
            _, _, mem_usage = line.chomp.split('$')
            @info << mem_usage
          end
        end
      end
    end
  end
end