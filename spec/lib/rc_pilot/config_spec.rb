require "spec_helper"

describe RcPilot::Config do
  before do
    @home = ENV["HOME"]
    @no_yaml = RcPilot::Config.new
    @yaml = RcPilot::Config.new("spec/fixtures/test_config.yaml")
    @new_home = RcPilot::Config.new("spec/fixtures/test_config.yaml", "#{@home}/test")
  end

  describe "home should be $HOME" do
    it "has proper home default" do
      @no_yaml.home.should eql @home
      @yaml.home.should eql @home
    end

    it "has new home" do
      @new_home.home.should_not eql @home
    end
  end

  describe "#path" do
    it "should return the default path" do
      @no_yaml.path.should eql "#{@home}/.dotfiles"
    end

    it "should return passed path" do
      @yaml.path.should eql "#{@home}/.rcfiles"
    end
  end

  describe "#repository" do
    it "should have a nil repository" do
      @no_yaml.repository.should eql nil
    end

    it "should have the repository path" do
      @yaml.repository.should eql "https://github.com/mahinshaw/dotfiles.git"
    end
  end
end
