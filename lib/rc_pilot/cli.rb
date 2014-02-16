module RcPilot
  class Cli < Thor
    include RcPilot::Util

    def initialize(*args)
      super
      # binding.pry
      # file = "#{Dir.pwd}/lib/rc_pilot/assets/sample_config.yaml"
      # @config = RcPilot::Config.new(file)
    end

    desc 'install', 'Link rc files into the $HOME directory.'
    def install(url, destination="#{ENV["HOME"]}/.dotfiles")
      # The install should look for any dependencied prescribed by the user - ie Prezto or Oh-my-zsh
      # Then the install should pull from the prescribed repository in the Config file(?).
      # Finally it should create symlinks for all of the prescribed rc files.
      clone(url, destination)
      binding.pry
      home ||= @config.path
      # Dir.foreach(home) { |f| link(f, home) unless f=='.' or f=='..' }
      puts "Get them dotfiles!"
    end

    desc 'remove', 'Unlink all of the rc files.'
    def remove()
      # The remove command should simply unlink the rc files.
      puts "Get them dotfiles gone!"
    end

    desc 'update', 'Update the rc files from the repository.'
    def update()
      # The update command should pull from all the submodules in the repo and then source the links.
      puts "Update them rcs yo!"
    end

    desc 'make', 'Make an rc repository'
    def make()
      # The make commmand should make a .dotfiles repo, init the git.
      puts 'start up the repo!'
    end

    desc 'add', 'Add existing rc files to the repository'
    def add()
      # The add command should add a file or a folder to the repo.  Default should be file if no args passed.
      puts "Add this file/folder to the repo yo!"
    end

    desc 'repo', 'Add a repository(git) for the dotfiles to be used.'
    def repo(url)
      # the repo method should contain the repository url for the dotfiles.
      puts "This be my repo yo!"
    end

    desc 'apply MESSAGE', 'Apply rc file changes and commit to the HEAD.'
    def apply(message)
      # Not a priority.
      # The apply command should add the working changes, and then commit them with a message.
      puts "Commit me changes"
    end

    desc 'push REMOTE', 'Save my changes to their respective repo, if I have those rights.'
    def push(remote)
      # Not a priority
      # The push should push the changes to the repository.
      puts "Beam'm up Scotty!"
    end
  end
end
