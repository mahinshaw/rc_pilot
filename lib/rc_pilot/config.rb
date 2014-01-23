require 'yaml'

module RcPilot
  attr_reader :configuration
  class Config
    attr_reader :home

    def initialize(file=false, home=ENV["HOME"])
      @home = home
      if file
        @configuration = YAML.load(File.open file)
      else
        @configuration = nil
      end
    end

    def path
      if @configuration
        return @path = "#{@home}/#{@configuration["folder"]}"
      else
        return @path = "#{@home}/.dotfiles"
      end
    end

    def repository
      if @configuration
        @repository = @configuration["repository"] || @configuration["repo"]
      else
        @repository = nil
      end
    end

    def dependencies
      if @configuration
        @dependencies = @configuration["dependencies"]
      else
        @dependencies = nil
      end
    end
  end
end
