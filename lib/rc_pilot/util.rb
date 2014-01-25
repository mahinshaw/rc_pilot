require 'fileutils'
require 'rugged'

module RcPilot
  module Util
    @@home = ENV["HOME"]
    @@oldFiles = "#{@@home}/rcfile.old"

    # Git based utilities
    def clone(url)

    end

    def init(path=nil)
      path ||= "#{@@home}/.dotfiles"
      return path
      # Repo.new(path)
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
