module RcPilot
  module Util
    include Thor::Actions

    module GitHelpers
      # Git based utilities
      def clone(url, destination="")
        stdin, stdout, stderr, wait_thr = Open3.popen3("git clone --recursive #{url} #{destination}")
        status = wait_thr.value
        stdin.close
        stdout.close
        stderr.close
        return status
      end

      def init(path=nil)
        stdin, stdout, stderr, wait_thr = Open3.popen3("git init #{path}") if path
        status = wait_thr.value
        stdin.close
        stdout.close
        stderr.close
        return status
      end
    end

    module FileHelpers
      # File helper utilities
      def link(file, home=ENV["HOME"])
        oldFiles = "#{home}/.oldFiles"
        dotfile = ".#{file}"
        Dir.mkdir(oldFiles) unless Dir.exists?(oldFiles)
        new_dotfile = File.join(home, dotfile)
        if (File.exist?(new_dotfile))
          FileUtils.mv(new_dotfile, File.join(oldFiles, file))
        end
        File.symlink(file, new_dotfile)
      end

      # returns an array of possible rc files
      def find_config_file(dir)
        # allow for .rcpilot(.yaml) or .rcprc(.yaml)
        possible_rc = [ ".rcpilot", ".rcprc" ]
        home = ENV["HOME"]
        rcs = []

        possible_rc.each do |rc|
          rc_path = File.join(home, rc)
          if File.exist(rc_path)
            rcs << rc_path
          end
        end

        unless rcs.empty?
        end

        return rcs
      end

      private

      def possible_rc(dir)
      end
    end

    include GitHelpers
    include FileHelpers

  end
end
