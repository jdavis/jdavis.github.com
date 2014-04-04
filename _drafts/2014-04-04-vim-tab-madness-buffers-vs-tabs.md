---
layout: post
title: Vim Tab Madness: Buffers vs Tabs
description:
    Vim's idea of what a tab is leads to a lot of confusion and is actually
    really limiting. Using buffers correctly is far more powerful. I explore
    that in this post as I was confused for a long time by it.
css:
    - /lib/lightbox/css/lightbox.css
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
    - /lib/lightbox/js/lightbox.js
---

{{ page.title }}
================

For a very, very long time, I was using tabs in Vim as you'd use tabs in most
other programs. I was used to the idea of a tab as being the place where a
document lives. When you want to edit a document, you move to that tab and edit
away! That's how tabs work so that must be how they work in Vim right?

Nope.

## Stop the Tab Madness

If you are using tabs like this then you are really limiting yourself and using
a feature of Vim that wasn't meant to work like this. Vim's tabs are named very
badly, as [others note][vim-layout], they would make more sense if they were
called *viewports* or *layout*.

Before I explain that, let's be sure we understand what a *buffer* is in Vim as
well as a few other basic things.

## Buffers

A buffer is nothing more than a file that you are editing that is loaded into
Vim. So when you issue this command:

```bash
$ vim .vimrc
```

You are actually launching Vim with a single buffer that is filled with the
contents of the `.vimrc` file. Easy peasy!

Now let's look at what happens when you try to edit multiple files. Let's issue
this command:

```bash
$ vim .vimrc .zshrc
```

Vim does what it did before, but instead of just 1 buffer, it opens another
buffer that is filled with .zshrc. So now we have two buffers open.

If you want to pause editing .vimrc and move to .zshrc, you could run this
command in Vim `:bnext` which will show the .zshrc buffer. There are various
other commands to manipulate buffers which you can see if you type `:h
buffer-list`.

## Windows

A window in Vim is just a way to view a buffer. Whenever you create a new
vertical or horizontal split, that is a window. For example, if you were to type
in `:help window`, it would launch a new window that shows the help
documentation.

The important thing to note is that a window can view any buffer it wishes; it
isn't forced to look at the same buffer. And we've all noticed this. When
editing a file, if we type `:vsplit`, we will get a vertical split and in the
other window, we will see the current file we are editing!

That should no longer be confusing because a window lets us look at *any*
buffer. It just so happens that when creating a new split: `:split` or
`:vsplit`, the buffer that we view is just the current one.

By running any of the buffer commands from `:h buffer-list`, we can modify which
buffer a window is *viewing*.

For an example of this, by running the following commands, we will start
editing two files in Vim, open a new window by horizontally splitting, and then
view the second file in the original window.

```
$ vim .vimrc .zshrc
:split
:bnext
```

## So a Tab is...?

So now that we know what a buffer is and what a window is. Here is what Vim says
in the Vim documentation regarding a buffer/window/tab:

> Summary:
>    A buffer is the in-memory text of a file.
>    A window is a viewport on a buffer.
>    A tab page is a collection of windows.

[vim-layout]: http://stackoverflow.com/a/103590
