require 'thor'

module RcPilot
  class Cli < Thor

    desc 'install', 'Link rc files into the $HOME directory.'
    def install()
      # The install should look for any dependencied prescribed by the user - ie Prezto or Oh-my-zsh
      # Then the install should pull from the prescribed repository in the Config file(?).
      # Finally it should create symlinks for all of the prescribed rc files.
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

    desc 'apply Message', 'Apply rc file changes and commit to the HEAD.'
    def apply(message)
      # Not a priority.
      # The apply command should add the working changes, and then commit them with a message.
      puts "Commit me changes"
    end

    desc 'push', 'Save my changes to their respective repo, if I have those rights.'
    def push()
      # Not a priority
      # The push should push the changes to the repository.
      puts "Beam'm up Scotty!"
    end
  end
end
