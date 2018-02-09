# Windows System Configuration Files

## [`WSL`](https://docs.microsoft.com/en-us/windows/wsl/install-win10) for Windows 10
1. Ensure Windows 10 OS is updated to a compatiable version ([version 2004 or higher](https://docs.docker.com/docker-for-windows/wsl/](https://docs.docker.com/docker-for-windows/wsl/#prerequisites))
    1. If Windows 10 Pro: Enable [Hyper-V (hyper visor)](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
    2. If Windows 10 Home: Update with [Microsoft Assistent](https://www.microsoft.com/en-us/software-download/windows10); Docker needs newer version than 1909.
    3. If Windows 10 Home: Update [WSL2 Linux Kernel](https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel)
    4. Helpful notes for this setup, in the following article section [How do I enable WSL](https://www.liquidweb.com/kb/how-to-setup-a-python-virtual-environment-on-windows-10/)
2. Get and install a linux distrobution (i.e. [`Ubuntu-18.04` in the Mirosoft Store](https://www.microsoft.com/store/productId/9N9TNGVNDL3Q)
3. Start a linux shell (i.e. `wsl -d Ubuntu-18.04`)
4. [The 2020 WSL files are found `\\wsl$\<Distribution>:`](https://superuser.com/a/1280916); In bash find the path of the current directory `explorer.exe .`.
   Note: [caution changing WSL ubuntu files with Windows tools, software, etc...](https://devblogs.microsoft.com/commandline/do-not-change-linux-files-using-windows-apps-and-tools/#comment-85115)

## Windows WSL add-ons
1. [Resolve Git line endings for WSL](https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-wsl-resulting-in-many-modified-files)
2. [Sharing Git credentials between Windows and WSL](https://code.visualstudio.com/docs/remote/troubleshooting#_sharing-git-credentials-between-windows-and-wsl) (need to install `git`, ref below steps)
3. [`jupyter-notebook` with WSL](https://medium.com/@rhdzmota/python-development-on-the-windows-subsystem-for-linux-wsl-17a0fa1839d)
4. Get and use [`zch` in WSL for Windows 10](https://medium.com/@vinhp/set-and-use-zsh-as-default-shell-in-wsl-on-windows-10-the-right-way-4f30ed9592dc)

## Install Docker for VM work
1. Ensure `WSL` for Windows 10 is enabled (if running Windows 10 Pro, can use `Hyper-V`)
2. Download and install [Docker for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)

## [7zip](https://www.7-zip.org/download.html) for compressed file handling
</br>Download and install

## [VS Code](https://code.visualstudio.com/) for Windows IDE
</br>Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux.

## ([`git`](https://git-scm.com/)) for version control
</br>May include:
- `bash` for running a terminal with *nix-like commands
- `vim` for a terimal editor

## May add ([`vim`](http://www.vim.org/) for terminal editor - [windows `vim` Github](https://github.com/vim/vim-win32-installer))
1. Add [`vim`](https://www.vim.org/)
</br>Additionally can be added to environment variable "PATH" similar to `git`

## Windows Environment Variable updates
1. Open "My Computer" and right click to get to "System Settings"
2. From there open "Advanced system settings"
3. Then open the "Environment Variables"
4. Under "System variables" edit the "Path" or "PATH" variable
5. Scroll to the end of the value already there, then add a ';' and (for `git`) "C:\Program Files\Git\bin"

## [ConEmu](https://conemu.github.io/) Terminal or [cmder](http://cmder.net/) Terminal
1. [Install ConEmu](https://conemu.github.io/) or [Install cmder](http://cmder.net/)
   - similar to `tmux` or `screen` program for handling multiple tabs and windows
2. Configure [ConEmu](https://conemu.github.io/) Profile Colors for "Solarized Dark"
    1. Running [ConEmu](https://conemu.github.io/), go to top right menu open 'Settings'
    2. Under 'Features' -> 'Colors' in the 'Schemes' dropdown select 'xterm' or 'Solarized'
    3. Then click the bottom right 'Save settings' button

## Customize Windows Terminals (e.g. cmd, powershell, `git` bash, etc.)
### Maybe add [Clink](http://mridgers.github.io/clink/)
</br>Powerful Bash-style command line editing for cmd.exe

### Maybe enable unix-like/linux-like commands
1. Add [Cygwin](https://www.cygwin.com/)
</br>Optionally add to path environment variables

### Add `git` bash completion
1. Add ["git bash-completion"](https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks#Auto-Completion)
</br>Needs Cygwin installed
</br>Copy "git-flow-completion.bash" file into "C:\Program Files\Git" directory
</br>Add the line `source $HOME/git-flow-completion.bash` to your `.bashrc` file

note: `.bashrc` and/or `bash_profile` should contain the following:
```bash
if [ -f /c/Program\ Files/Git/git-flow-completion.bash ]; then
source /c/Program\ Files/Git/git-flow-completion.bash
fi
```
### Update Windows `cmd` terminal prompt
1. Open "My Computer" and right click to get to "System Settings"
2. From there open "Advanced system settings"
3. Then open the "Environment Variables"
4. Under "User variables..." create a "New" variable
5. The 'Variable' is "PROMPT"
6. The 'Value' is "$e[1;32m%USERNAME%@%computername% $e[33m$e[t$p$e[T$e[1;34m $$ $e[m"

## Configure and customize programs with dot files (i.e. use this repository)
1. `$ git clone git@github.com:atrexel/dotfiles.git`

2. Create a `.gitconfig` file
</br>`$ cp ./dotfiles/.gitconfig $HOME/`
(update e-mail and username)

3. Create a `.bashrc`, `.bash_profile` and `.profile` file
(could symlink all to one file as these are more or less the same)
</br>`$ cp ./dotfiles/windows/.bashrc $HOME/`

4. Add a `_vimrc` file
(`vim` downloaded from steps above will look for `_vimrc` file in `$HOME/_vimrc`)
</br>`$ cp ./dotfiles/windows/vim/_vimrc $HOME/` (without any "pathogen" logic)
</br>`$ cp ./dotfiles/windows/vim/_vimrc-pathogen $HOME/_vimrc` (with "pathogen" logic)

5. Setup `_vimrc` dependencies (needed for Pathogen goodies)
* Setup [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
* Setup [itchyny/lighline.vim](https://github.com/itchyny/lightline.vim)
* Setup [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* Setup [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* Setup [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* Setup [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

## Enable program languages
1. [`python` on windows](https://www.python.org/downloads/)
   - handling multiple versions of [`python` with `virtualenv`](https://www.freecodecamp.org/news/installing-multiple-python-versions-on-windows-using-virtualenv/)
   - installing [`pip` on windows](https://www.liquidweb.com/kb/install-pip-windows/)
2. [`rust`](https://www.rust-lang.org/tools/install)
   - [Install and setup rust dev env on WSL2](https://medium.com/@harsimran.maan/install-and-setup-rust-development-environment-on-wsl2-dccb4bf63700)
3. [`node`](https://nodejs.org/en/download/)

## Maybe setup VS, `c`, `c++`, `gcc`, and `g++` for Windows
### Setup [Visual Studio](https://visualstudio.microsoft.com/)
1. Download and Install [Visual Studio](https://visualstudio.microsoft.com/downloads/)
### `MinGW` and `cmake`
1. [`GCC` and `G++` with MinGW](http://www.mingw.org/)
2. [`cmake`](https://cmake.org/download/)

## Look to dev-win-notes for pro tips
* Cycling through Windows 10 programs with keyboard [Stackoverflow WIN+n (where n is app number place on taskbar)](https://stackoverflow.com/a/32402246/3299884).

## Notes for symlinks in Windows
Create symbolic links with [`mklink` on Windows](https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/)