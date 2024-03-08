module Panopticon
  module Controllers
    def panopticon
      class_eval do
        before_action :initialize_memory_watcher
        after_action :wrap_up_memory_watcher

        @@warmup_request = true

        def initialize_memory_watcher
          @initial_memory = GetProcessMem.new.kb
          # @@leaking_data ||= []
          # 10_000.times do
          #   @@leaking_data << 'a' * 1_000  # Simulate large objects
          # end
        end

        def wrap_up_memory_watcher
          if @@warmup_request
            @@warmup_request = false
          else
            @final_memory = GetProcessMem.new.kb
            write_to_temp_file(parse_text_for_tmp)
          end
        end

        def path_info
          Rails.application.routes.recognize_path(request.env['REQUEST_PATH'])
        end

        def parse_text_for_tmp
          "#{path_info[:controller]}$#{path_info[:action]}$#{@final_memory - @initial_memory}\n"
        end

        def write_to_temp_file(text)
          file_path = '../../memtemp.txt'
          File.open(file_path, 'a') do |file|
            file.puts text
          end
        end
      end
    end
  end
end