module RcPilot
  module Util
    include Thor::Actions

    # Git based utilities
    def clone(url, folder="")
      stdin, stdout, stderr, wait_thr = Open3.popen3("git clone --recursive #{url} #{folder}")
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

    # File helper utilities
    def link(file)
      dotfile = ".#{file}"
      Dir.mkdir(@@oldFiles) unless Dir.exists?(@@oldFiles)
      new_dotfile = File.join(@@home, dotfile)
      if (File.exist?(new_dotfile))
        FileUtils.mv(new_dotfile, File.join(@@oldFiles, file))
      end
      File.symlink(file, new_dotfile)
    end
  end
end
