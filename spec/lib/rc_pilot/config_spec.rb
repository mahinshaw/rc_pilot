require "spec_helper"

describe RcPilot::Config do
  let (:env_home) { ENV["HOME"] }
  let (:home)  { "#{env_home}/rcTest" }

  # home for the test will exist in a file separate from that of ~/
  before do
    @no_yaml = RcPilot::Config.new
    @yaml = RcPilot::Config.new("spec/fixtures/test_config.yaml")
  end

  describe "home" do
    it "has proper home default" do
      @no_yaml.home.should eql env_home
    end

    it "has configurated home" do
      @yaml.home.should eql home
    end
  end

  describe "#path" do
    it "should return the default path" do
      @no_yaml.path.should eql "#{env_home}/.dotfiles"
    end

    it "should return passed path" do
      @yaml.path.should eql "#{home}/.rcfiles.test"
    end
  end

  describe "folder" do
    it "has the default folder name" do
      @no_yaml.folder.should eql ".dotfiles"
    end

    it "should return the configured folder" do
      @yaml.folder.should_not eql ".dotfiles"
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

  describe "#dependencies" do
    it "has no dependencies" do
      @no_yaml.dependencies.should eql nil
    end

    it "configuration has dependencies" do
      @yaml.dependencies.size.should eql 2
    end
  end
end
