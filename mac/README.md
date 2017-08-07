# Mac System Configuration Files

## Package Manager for MacOS (use [`homebrew`](https://brew.sh/))

1. Install [`homebrew`](https://brew.sh/)
(if it's not already installed)
</br>Check install with `$ brew --version`
</br>Export the PATH: `$ export PATH=/usr/local/bin:$PATH`

2. Update `homebrew`

`$ brew update`

## Terimal (use [iTerm2](https://www.iterm2.com/))

1. [Install iTerm2](https://www.iterm2.com/)

2. Update Profile Colors to use "Solarized Dark"
</br>Go to 'Preferences' -> 'Profiles' -> 'Colors' and select from the 'Color Presets' menu "Solarized Dark"

## Text Editor (use [`vim`](http://www.vim.org/))

1. Install `vim`
</br>`$  brew install vim`

## [Mac Command Line Tools](http://osxdaily.com/2012/07/06/install-gcc-without-xcode-in-mac-os-x/)

1. Install Command Line Tools
</br>`$ xcode-select --install`

2. When prompted from "“The xcode-select command requires the command line developer tools. Would you like to install the tools now?”" click "Install"

note: Command Line Tools are installed here: `/Library/Developer/CommandLineTools/`
</br> (this is the root `/Library` not the user `~/Library`)

## Version Control Tool (use [`git`](https://git-scm.com/))

1. An OSX Git installer is maintained and available for [download at the Git website](http://git-scm.com/download/mac)

2. Add ["git bash-completion"](https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks#Auto-Completion)
</br>`$ brew install bash-completion`
</br>`$ brew tap homebrew/completions`

note: `.bash_profile` should contain the following:
```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
```

## Setup dot files (use this repository)

1. `$ git clone git@github.com:atrexel/dotfiles.git`

2. Create a `.gitconfig` file
</br>`$ cp ~/dotfiles/.gitconfig ~/`
(update with your e-mail and username)

3. Create a `.bashrc`, `.bash_profile` and `.profile` file
(could symlink all to one file as these are more or less the same)
</br>`$ cp ~/dotfiles/mac/.bashrc ~/`

4. Create a `.tmux.conf` file
</br>`$ cp ~/dotfiles/mac/.tmux.conf ~/`
(appropriately update the file where `{...}` text is found)

5. Create a `.screenrc` file
</br>`$ cp ~/dotfiles/mac/.screenrc ~/`

6. Setup `.vimrc` dependencies (needed for Pathogen goodies)
* Setup [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
* Setup [itchyny/lighline.vim](https://github.com/itchyny/lightline.vim)
* Setup [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* Setup [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* Setup [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* Setup [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

7. Create a `.vimrc` file
</br>`$ cp ~/dotfiles/mac/.vimrc ~/` (without any "pathogen" logic)
</br>`$ cp ~/dotfiles/mac/.vimrc-pathogen ~/.vimrc` (with "pathogen" logic)
