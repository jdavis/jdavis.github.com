---
layout: post
title: Oh-my-zsh is the Disease and Antigen is the Vaccine
description:
    I used oh-my-zsh for years but finally got fed up with the slow issue
    resolution and rate of development. Antigen is a far better solution for
    managing your zsh configuration. I take a look at why it is better and how
    to set it up in this post.
css:
    - /css/code.css
---

# {{ page.title }}

[oh-my-zsh][omz] is one of the [most popular repositories][stars] on GitHub with
17,500+ stars. If you use zsh as your main shell, you likely have heard of
oh-my-zsh or even use it.

It features "120+ optional plugins" and just as many themes for your beloved
shell. It has a great [default library][omz-lib] that turns on a lot of great
zsh features that make it better for new users.

However, I think that oh-my-zsh has actually become a bit harmful to the goal
that it is trying to achieve.

## The Problem

oh-my-zsh is a great idea but it has evolved quite a bit past its [initial
import into Git][omz-initial].

It was never "designed" to support the plugin directory that it is trying to be.
The intention of providing plugins has grown beyond manageability. Let's take a
better look at the issues that oh-my-zsh has.

### Git/GitHub

Using version control for something as volatile as plugins is a bit strange.
While it has been working for [Homebrew][homebrew], Homebrew only maintains
instructions on how to install each package; it obviously doesn't contain the
source of the package which is far more volatile.

Using a massive repository for this just isn't the greatest idea for maintaining
a list of plugins. Why should I have to download EVERY single plugin when I just
want to use a few. Even though most plugins are a single or a few files, it just
doesn't scale and is unnecessary.

To make an analogy, it would be like having one large repository for every
single Vim plugin. The thought is just absurd.

### Inactivity

The other problem is that [Robby Russell][omz-robby] appears to be the only
collaborator that handles pull requests and issues. Every single change must go
through him and be approved. The effort just seems outrageous. The [Bus
factor][bus-factor] should definitely not be that low.

At one point, there was a span of 45 days from May to nearly July in which
nothing happened.

As of right now, there are nearly [~400 issues][omz-issues] open on the
oh-my-zsh repository with 70% of them being pull requests.

This isn't a knock against Robby in anyway either. We all get busy and I know
first hand that managing issues is sometimes the last thing you want to do.
However it is a reason to look into alternative solutions that don't have this
dependency on a single person.

### Adding Customizations

oh-my-zsh gives some pointers on adding your [own customizations][omz-custom].
What does it suggest?

It says to add your own files into the `custom/` directory. That sounds easy.
But what do you do if you want to hold those in version control as well? You
either have to use something like a Git submodule or you have to maintain your
own Fork of oh-my-zsh. I already have a few submodules in [my
dotfiles][dotfiles], but it isn't a very fun thing to manage. Each change
becomes two commits (one for the change, one for the submodule reference), and
it is very easy to forget to push a submodule change while updating the
reference in the main repository.

I had [my own fork][omz-fork] that I kept my customizations in for a couple
years but if I wanted new updates, I would have to merge in the new changes from
upstream. It isn't that bad of a process but it is extra work and I'd argue
forks aren't the best for this.

### Where do we go from here then?

oh-my-zsh has done a lot for the community and has helped make zsh popular. This
is great but a solution is being developed that addresses these problems.

Let's take a look at it.

## Introduction to Antigen

[Antigen][antigen] cites that it is directly inspired by [Vundle][vundle], which
is a great plugin manager for Vim. Vundle was inspired by [Pathogen][pathogen]
which was the first plugin manager for Vim. Thus this is the reason Antigen is
named after an [Immunology][immuno] term.

Essentially what you do is list plugins in your `.zshrc` and it will
automatically download them. It allows you to run various commands such as
updating all the plugins, clean up unused plugins, and more.

The configuration is super simple and it addresses all of the issues with
oh-my-zsh. In fact, all of this is mentioned in the [Motivation
section][antigen-omz] of the README.

## Antigen Features

Antigen has a great set of features as of right now.

### Easy Setup & Installation

If you are familiar with Vundle, then Antigen will make complete sense. Here's
what I currently have in my [.zshrc][zshrc] for the plugins that I use:

{% highlight bash %}
# Load Antigen
source ~/.antigen.zsh

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Antigen Theme
#

antigen theme jdavis/zsh-files themes/jdavis

#
# Antigen Bundles
#

antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# For SSH, starting ssh-agent is annoying
antigen bundle ssh-agent

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

antigen bundle jdavis/zsh-files

# Secret info
antigen bundle git@github.com:jdavis/secret.git
{% endhighlight %}

This setup makes it trivial to find new plugins and add them to your setup.
Heredocs can be used instead but I find this approach a bit nicer to read.

As an example, before to use [z][z], I had to add a [submodule][z-submod], which
would have to be updated if there were any bug fixes/feature fixes. Then I had
to create a [`custom/z.zsh`][omz-z] script that would load z.

In my new setup, it has become one line: `antigen bundle rupa/z` And retrieving
new updates is just a command away: `antigen update`.

### Single Dependency

Instead of having to manage an entire fork or submodule, the entirety of Antigen
lives in a file called [`antigen.zsh`][antigen-source] which can be added to
your dotfiles.

In the event that there is a bug fix or feature added, all that is required to
do is to run `antigen selfupdate` and then commit the changes. No longer must
must you fetch and merge upstream changes.

### Autoloading

Antigen has tries to automatically load various files in a plugin. It has a few
mechanisms that it uses to do this. If you are interested in writing a plugin,
there is a [section on what rules it follows][antigen-loading].

## Antigen Drawbacks

Antigen isn't perfect however. There are a few idiosyncrasies that are a bit
annoying. Here's what I think could be improved based off of the current
version.

### Error Checking

Antigen relies on Git and when Git isn't installed, you are greeted with some
pretty errors every single time a shell is opened.

Obviously the fix would be to check if all the required tools are installed
before blindly proceeding. It is a simple fix but would make the user experience
a bit nicer.

Also, if a repository is private, which is what I do to manage sensitive
information like IP's of my servers and other private things, it will try to
download it every time a shell is opened up.

A more sane alternative is to check if permissions are required and instead of
trying to download it every single time, just keep a list of ones that aren't
accessible due to permission. Then once the user is ready (say after they have
setup their GitHub private keys and loaded ssh-agent), the user could then try
to reinstall all the plugins that failed.

### Automatic Downloading is a Mess

In addition to the errors that you get when Git isn't installed, every time you
open a new shell, it will automatically try to download any missing plugins.

This goes with the above points but it would be great to turn this off. I'd
argue it should be off by default as well.

### Version Locking

This actually is something missing from Vundle but in some other Vim plugin
managers. But there is no way to lock to a specific tag or version (a release in
GitHub-lingo).

This would prevent issues where the master is used for development and potential
broken changes might slip through.

## Conclusion

oh-my-zsh has always had noble intentions, yet it has fallen short as it has
grown. I feel that a better, more sustainable solution is required for managing
plugins in zsh.

Antigen so far has been a great attempt at that and my chosen tool to remedy
these shortcomings of oh-my-zsh. As mentioned, it isn't without its flaws but
that is expected of projects; the base features are there which is far more
important.

[omz]: https://github.com/robbyrussell/oh-my-zsh
[stars]: https://github.com/search?q=stars%3a%3E1&s=stars&type=Repositories
[omz-lib]: https://github.com/robbyrussell/oh-my-zsh/tree/master/lib
[omz-custom]: https://github.com/robbyrussell/oh-my-zsh#customization
[omz-fork]: https://github.com/jdavis/oh-my-zsh
[dotfiles]:https://github.com/jdavis/dotfiles
[antigen]: https://github.com/zsh-users/antigen
[antigen-omz]: https://github.com/zsh-users/antigen#motivation
[vundle]: https://github.com/gmarik/Vundle.vim
[omz-issues]: https://github.com/robbyrussell/oh-my-zsh/issues
[omz-robby]: https://github.com/robbyrussell/oh-my-zsh/commits/master?author=robbyrussell
[omz-initial]: https://github.com/robbyrussell/oh-my-zsh/tree/5da20b9dddb1f7a9110675ded5df59c4c3ed1b83
[bus-factor]: http://en.wikipedia.org/wiki/Bus_factor
[immuno]: http://en.wikipedia.org/wiki/Immunology
[pathogen]: https://github.com/tpope/vim-pathogen/
[zshrc]: https://github.com/jdavis/dotfiles/blob/master/.zshrc
[z]: https://github.com/rupa/z
[z-submod]: https://github.com/jdavis/dotfiles/commit/36d72a26eb80b3a944d276fa0b32544e2eecf18c
[omz-z]: https://github.com/jdavis/oh-my-zsh/blob/master/custom/z.zsh
[antigen-loading]: http://zsh-users.github.io/antigen/#notes-on-writing-plugins
[antigen-source]: https://github.com/zsh-users/antigen/blob/master/antigen.zsh
[homebrew]: https://github.com/Homebrew/homebrew
