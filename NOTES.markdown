# TODO/features List
-----------
### Commands that are needed
  1. install
      - a url for the desired repository should be passed.
      - should run pre commands.
      - should pull and install the dependencies.
      - should pull the repository if it is in config file.
      - should link files in home folder( or another folder if desired by the user )
      - should run post execution commands (i.e 'vim +BundleInstall +qall' etc)
  2. uninstall/remove/unlink
      - should unlink all files that were linked in the install process.
      - ?should remove the repository if option is passed.
  3. update
      - should pull from git repository for dotfiles.
      - with option passed, should update dependencies as well.
  4. add
      - should add the passed file to the dotfiles repository.
  5. makerc
      - this should init (git) a repository to use for rc files.

### Configuration file
The configuration file should live inside the desired dotfiles repository.
If there is no configuration file, one should be created based on the repository pulled from.

    repository:
    folder:
    home:
    dependencies:
    pre:
    post:
