---
layout: post
title:
    Heavy-handed HackerNews&#58; Mods are Unnecessarily Editing Titles and
    Swapping URLs
description:
    I used oh-my-zsh for years but finally got fed up with the slow issue
    resolution and rate of development. Antigen is a far better solution for
    managing your zsh configuration. I take a look at why it is better and how
    to set it up in this post.
---

# {{ page.title }}

I have been less than thrilled about the increase in administrative "duties"
that have been going on with HackerNews since pg stepped down administrating the
site.

## Experiment

As an experiment, I've changed the title of my post to see if it happens first
hand.

The title of the submission should be *Heavy-handed HackerNews: This Title
Should Differ from the Article*.

## URL Hot Swapping

In particular, [dang][dang] has a habit of hot swapping out URL submissions from
underneath the comments.

Just last night an article was posted linking to [Errata Security's][errata]
post on [Reading the Silk Road configuration][silk-conf].

The [comment section][silk-comments] for the submission started off discussing
the original posting. Yet at some point, the submission was changed to point to
[Brian Kreb's post][kreb] which had a less technical take and more general.

This hot swapping was noticed in [the comments][silk-disc] as well.

Doing this is unfair for a variety of reasons:

1. The original submission could be from the author.
2. The comments can cease to be relevant (like the previous example).
3. The submitted article might add on to a more "credible" article that it
   refers to (like the previous example).

## Title Changing

There is some rule that says submissions should have the original title of the
web page. This is quite inane in various circumstances.

I have actually been the victim of this title changing as being an author of
something linked to.

I wrote the [September newsletter][neovim] for Neovim. Within the hour, the
newsletter was [posted to HackerNews][neovim-hn] with a title that mentioned the
new newsletter as well as mentioning the word Neovim.

This makes sense as the title of the article doesn't include Neovim. That's
because "Neovim" is [prepended to the Jekyll template][jekyll] that is used for
rendering the page. The final `<title>` tag in the HTML becomes `<title>Issue #3
- Better Late than Never - Neovim</title>`

It was then changed to "Issue #3 – Better Late Than Never" which makes
absolutely no sense without seeing the URL. I wasn't the only one to notice
either as [this comment][comment] points out.

## Conclusion

I understand that moderation is a necessity for spam, insults, sensational
titles and the like. However this micro-moderating of submissions that degrade
and *change* the original submissions needs to stop.

[dang]: https://news.ycombinator.com/user?id=dang
[errata]: http://blog.erratasec.com/2014/10/reading-silk-road-configuration.html
[silk-conf]: http://blog.erratasec.com/2014/10/reading-silk-road-configuration.html
[silk-comments]: https://news.ycombinator.com/item?id=8404511
[silk-disc]: https://news.ycombinator.com/item?id=8404723
[kreb]: http://krebsonsecurity.com/2014/10/silk-road-lawyers-poke-holes-in-fbis-story/
[neovim]: http://neovim.org/news/2014/sept/
[neovim-hn]: https://news.ycombinator.com/item?id=8290283
[comment]: https://news.ycombinator.com/item?id=8292175
[jekyll]: https://github.com/neovim/neovim.github.io/blob/master/_layouts/default.html#L9
