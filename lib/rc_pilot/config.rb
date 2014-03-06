module RcPilot
  class Config
    include RcPilot::Util

    attr_reader :home, :folder, :config_file

    def initialize(file = nil)
      @config_file = file ? YAML.load(ERB.new(File.read(file)).result) : nil
      get_home_folder
    end

    def path
      return "#{@home}/#{@folder}"
    end

    def repository
      return @config_file ? @config_file["repository"] : nil
    end

    def dependencies
      return @config_file ? @config_file["dependencies"] : nil
    end

    private

    def get_home_folder
      @home   = ENV["HOME"]
      @folder = ".dotfiles"

      if @config_file
        @home   = @config_file["home"]   if @config_file["home"]
        @folder = @config_file["folder"] if @config_file["folder"]
      end
    end

  end
end
