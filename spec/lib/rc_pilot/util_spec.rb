require "spec_helper"
require "fileutils"

describe RcPilot::Util do
  let (:util) { Class.new.extend(RcPilot::Util) }
  let (:home) { "#{ENV["HOME"]}/rcTest" }
  let (:repo) { 'https://github.com/mahinshaw/dotfiles' }
  let (:folder) { '.dotfiles' }

  before(:all) do
    here = "#{ENV["HOME"]}/rcTest"
    Dir.mkdir(here) unless Dir.exist?(here)
  end

  # TODO: make sure the clone hapens and it lands in the right place
  describe "#clone" do
    before(:each) do
      @status = util.clone(repo, "#{home}/#{folder}")
    end

    it "exits with success" do
      @status.success?.should eql true
    end

    it "exits without success" do
      @status.success?.should eql false
    end

    after(:all) do
      FileUtils.rm_rf("#{home}/#{folder}")
    end
  end

  # TODO: make sure the repo is initialized and ithe proper path. Test with default path and passed path.
  describe "#init" do
  end

  # TODO: test that links are created and old files are moved.
  describe "#link" do
  end

  describe
end
