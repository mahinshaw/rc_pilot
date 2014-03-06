require "spec_helper"

describe RcPilot::Cli do
  let(:cli) { RcPilot::Cli }
  let(:path) { create_construct }
  let(:home) { path.directory "home" }
  after { home.destroy! }

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
    before do
      ARGV.replace(["install", "https://github.com/mahinshaw/dotfiles"])
    end

    it "should write to console" do
      out, err = capture_io { cli.start }
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
