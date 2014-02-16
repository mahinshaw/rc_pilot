module RcPilot
  attr_reader :configuration
  class Config
    attr_reader :home, :folder

    def initialize(file = nil)
      @configuration = file ? YAML.load(ERB.new(File.read(file)).result) : nil
      get_home_folder
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

    private

    # set the default home and folder even if there is no yaml
    def get_home_folder
      @home   = ENV["HOME"]
      @folder = ".dotfiles"

      if @configuration
        @home   = @configuration["home"]   if @configuration["home"]
        @folder = @configuration["folder"] if @configuration["folder"]
      end
    end

  end
end
