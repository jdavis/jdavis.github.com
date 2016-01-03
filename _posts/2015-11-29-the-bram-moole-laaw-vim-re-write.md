---
layout: post
title:
    The Bram Moole-Laaw&#58; There Will be Attempts to Rewrite Vim in Nearly
    Every New Language
description:
    An attempt at naming the Vim rewrite phenomenon that we all have seen.
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
---

# {{ page.title }}

It started out as a tongue-in-cheek [Tweet][tweet] but I've decided to write a
blog post on it so it can reach a wider audience. Plus it's always fun to come
up with new software laws and Jeff Atwood [would agree][atwood-law].

Before we get to the law though, let's look at why this law exists.

## A Very Short History

Vim is one of the most popular text editors of all time and has been around for
[nearly 30 years (pdf)][vim-history] since version 1.0.

It has perhaps the most imitated and desired key bindings (possibly second only
to [GNU readline's][gnu-readline]) when it comes to editing. Somehow these
key bindings make their way into nearly every mainstream editor that comes
along.

Here are some of the latest and greatest editors (as well as [one of the
worst][editor-war]) with their accompanying Vim plugins:

1. [Atom][editor-atom1] with [Vim Mode][editor-atom2]
2. [Sublime Text][editor-sublime1] with [Vintage Mode][editor-sublime2]
3. [Brackets][editor-brackets1] with [Vimderbar][editor-brackets2]
4. [All of Jetbrain's IDEs][editor-jetbrains1] with [IntelliVim][editor-jetbrains2]
5. [Emacs][editor-emacs1] with [Evil][editor-emacs2] (the worst, *obviously*)

The list goes on and on. The most salient point is that Vim quite clearly has
hit a sweet spot in developer's hearts with the ability to edit text fast, with
its modal editing, and overall power without ever requring a mouse.

## The First Rewrite

There are a lot of people that know that Vim stands for Vi iMproved but this
wasn't true until its 2.0 release in 1993. Before being called Vi iMproved, it
was called Vi iMitation. Do you see a pattern?

The reason for this is because [Bram Moolenaar][bram-wiki], the original creator
of Vim (and apparently a big fan of German beer as dictated by his Wikipedia
picture?), had an Amiga computer at the time but Vi wasn't available for it. So
he started out with a different text editor and eventually built it up to add Vi
functionality.  In fact, Vim still has Amiga code and might still work with
[some versions][vim-amiga].

This was the first Vi rewrite (albeit in the same language, C) and a very large
success by Bram. To this day, if you run `vi` on most systems, it is just
symlinked to `vim` as you can see from El Capitan's `/usr/bin/`.

<div class="gallery medium">
    <a href="/img/bram/symlink.png">
        <img src="/img/bram/symlink.png" alt="OS X 10.11 /usr/bin">
        <span>OS X 10.11's /usr/bin</span>
    </a>
</div>

## The Law

This finally brings me to The Law which will from now on will be called **The Bram
Moole-Laaw**. This is because Bram is currently the [BDFL][bram-bdfl] of Vim and
was the first (and so far the last?) person to ever successfully rewrite
Vi/Vim.

Here is The Law:

> With any new language that is sufficiently popular, it will be used to
> re-write Vim from *within* Vim as long as Vim is still around.

The first quantifier is there because anyone can create a little language. But
this law won't hold if enough people don't use the language.

The second quantifier is mainly a joke in that most of the people writing these
rewrites are probably using Vim to code in.

## A Refactoring?

Now I know what you are all thinking, what about [Neovim][neovim-site]? Well,
Neovim has never wanted to rewrite Vim from scratch. It is just a refactoring.

In [an interview][neovim-interview], Justin Keyes, one of the project managers for Neovim, was asked
what he thought about porting Neovim (or Vim for that matter) to another
language or rewriting it.

Here was his reply:

> Crazy idea. Many have tried and they all have pretty much failed. And there
> still are new projects coming out.

When given an example of a [latest Rust rewrite of Vim][vim-rust], Justin
continues:

> The thing is, it sounds like a fun project. But the problem is, people always
> get past the first few steps and have an interface that feels like Vim,
> mostly. At least for the way the commands work together.
>
> But then there are all these dark, dusty, unsexy corners that never get
> implemented because they are boring. They are full of corner cases that were
> already figured out in Vim.  Like the way that it handles shell commands and
> redirects. That has all been figured out already. That's not going to exist in
> the Vim port that someone wrote for fun because it's not a fun thing to
> implement. It's actually a mess.
>
> Things like cscope and tags. The ctags support in Vim is pretty good and
> useful but if you are going to write a new editor, you're going to be like
> "this is dumb, I'm going to do it a different way" but then that's going to be
> yet another feature that someone that is used to Vim is not going to be there
> and they are going to miss it because it works in a very specific way.

Justin then goes on to discuss some other features of Vim that might be lost in
such ports.

## Conclusion

Vim is a great editor and will forever be remembered if its end ever comes. I
don't fault anyone for wanting to rewrite it.

However, now when the next rewrite comes along, we can use common vocabulary to
discuss such an event.

Also, this article was written in pure jest and I meant nothing malicious to all
those that have tried. I think all of the rewrites are great because it is a
great way to learn new concepts and a new language. Plus like I mentioned, Vim
was just an iMitation at the start as well.

[editor-atom1]: https://atom.io/
[editor-atom2]: https://github.com/atom/vim-mode

[editor-sublime1]: https://www.sublimetext.com/
[editor-sublime2]: https://www.sublimetext.com/docs/2/vintage.html

[editor-brackets1]: http://brackets.io/
[editor-brackets2]: https://github.com/daveosborne/brackets-vimderbar

[editor-emacs1]: https://www.gnu.org/software/emacs/
[editor-emacs2]: http://www.emacswiki.org/emacs/Evil

[editor-jetbrains1]: https://www.jetbrains.com/
[editor-jetbrains2]: https://github.com/JetBrains/ideavim

[tweet]: https://twitter.com/HopefulJosh/status/639179394309685248
[vim-history]: http://moolenaar.net/vimstory.pdf
[editor-war]: https://en.wikipedia.org/wiki/Editor_war

[atwood-law]: http://blog.codinghorror.com/the-principle-of-least-power/

[neovim-site]: https://neovim.io/
[neovim-interview]: https://youtu.be/R7z2GQr9-tg?t=38m20s

[bram-wiki]: https://en.wikipedia.org/wiki/Bram_Moolenaar
[bram-bdfl]: https://en.wikipedia.org/wiki/Benevolent_dictator_for_life
[gnu-readline]: https://en.wikipedia.org/wiki/GNU_Readline#Keyboard_shortcuts

[vim-rust]: https://github.com/mathall/rim
[vim-amiga]: http://www.vim.org/download.php#amiga
