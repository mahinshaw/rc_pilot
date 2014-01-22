require 'yaml'

module RcPilot
  attr_reader :configuration
  class Config
    def initialize(file)
      @configuration = YAML.load(File.open file)
    end

    def path
      @path = "#{ENV["HOME"]}/#{@configuration["folder"]}" || "#{ENV["HOME"]}/.dotfiles"
      return @path
    end

    def repository
      @repository = @configuration["repository"] || @configuration["repo"] || nil
      return @repository
    end

    def dependencies
      @dependencies = @configuration["dependencies"] || nil
      return @dependencies
    end
  end
end
