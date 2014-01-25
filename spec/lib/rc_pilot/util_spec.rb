require "spec_helper"

describe RcPilot::Util do
  let (:util) { Class.new.extend(RcPilot::Util) }
  let (:home) { ENV["HOME"] }

  before do
  end

  # TODO: make sure the clone hapens and it lands in the right place
  describe "#clone" do
  end

  # TODO: make sure the repo is initialized and ithe proper path. Test with default path and passed path.
  describe "#init" do
    it "returns the proper path" do
      util.init.should eql "#{home}/.dotfiles"
    end
  end

  # TODO: test that links are created and old files are moved.
  describe "#link" do
  end

  describe
end
