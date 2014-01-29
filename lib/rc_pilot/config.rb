module RcPilot
  attr_reader :configuration
  class Config
    attr_reader :home, :folder

    def initialize(file=nil)
      @configuration = file ? YAML.load(ERB.new(File.read(file)).result) : nil
      @home = @configuration ? @configuration["home"] : ENV["HOME"]
      @folder = @configuration ? @configuration["folder"] : ".dotfiles"
    end

    def path
      return "#{@home}/#{@folder}"
    end

    def repository
      return @configuration ? @configuration["repository"] : nil
    end

    def dependencies
      return @configuration ? @configuration["dependencies"] : nil
    end
  end
end
