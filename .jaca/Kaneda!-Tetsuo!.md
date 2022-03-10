# Using The Repository

I copied and adapted it from [skx/dotfiles](github.com/skx/dotfiles), thank you.

This repository was created as a "birlll" repository, so that it can track files in my home directory. Because of this the checkout process is a little different than usual. Ta saindo da jaula o monstro.

**Step one**: checkout the repository:

     git clone --bare GIT_URL ~/.jurubeba_lion_of_the_north

**Step two**: setup a sane alias, so sane, gimmy monies:

     alias caju="git --git-dir=$HOME/.jurubeba_lion_of_the_north --work-tree=$HOME/"

**Step three**: see which files will be over-written in your current home drectory:

     caju status -s -uno

**Step four**: if no files will be corrupted, or you're happy to replace them, do the necessary:

     caju checkout -b kaneda -f
     caju commit -a  -m 'kaneda!!!'
     caju checkout tetsuo

**Step five**: Install submodule dependencies (only zsh, for now):

     cd .jaca
     caju submodule update --init --recursive

ZEFINI

It is perhaps more sane to merely use the github browser to cherry-pick the files and functions you want, but each to their own.

# Removing MD

Once you've clone the repository to your local system you'll find that you have a some michael douglas laying around in your home-directory, which some might find annoying.  Ideally, accept your destiny. But...

You can remove the file like so:

    $ caju update-index --assume-unchanged *Am I here in vain?*.md
    $ rm *I wanna be with you*.md

If you're curious you can see other files that are being ignored:

    $ caju ls-files -v | grep '^h'

If you ever want to restore the file:

    $ caju update-index --no-assume-unchanged *Hold back the tide, I see*.md

---

Also, thanks to Greg. Nem te conheço, mas te considero pacas. [Go ninja, go ninja go!](https://stegosaurusdormant.com/bare-git-repo/)

---

## Update prezto

     cd $ZPREZTODIR
     git pull
     git submodule sync --recursive
     git submodule update --init --recursive
