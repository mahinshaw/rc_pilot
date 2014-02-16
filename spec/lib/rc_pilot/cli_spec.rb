require "spec_helper"

describe RcPilot::Cli do
  let(:cli) { RcPilot::Cli }
  let(:path) { create_construct }
  after { home.destroy! }

  let(:home) { path.directory "home" }

  before :each do
    ARGV.clear
  end

  context "no arguments" do
    it "runs with no errors" do
      out, err = capture_io { cli.start }
      expect(err).to be_empty
    end
  end

  # try out test_construct
  describe "#install", test_construct: true do
    it "should write to console" do
      out, err = capture_io { cli.start ["install"] }
      expect(out).to eq("Get them dotfiles!\n")
      puts home
    end
  end

  describe "#remove" do
    it "has silly text output" do
      out, err = capture_io { cli.start ["remove"] }
      expect(out).to eq("Get them dotfiles gone!\n")
    end
  end

  describe "#update" do
  end

  describe "#make" do
  end

  describe "#add" do
  end
end
