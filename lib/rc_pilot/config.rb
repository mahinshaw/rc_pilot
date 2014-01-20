module RcPilot
  class Config
    def root
      Dir.mkdir("#{ENV["HOME"]}/.dotfiles") unless File.directory?(File.expand_path("~/.dotfiles"))
      "#{ENV["HOME"]}/.dotfiles"
    end
  end
end
