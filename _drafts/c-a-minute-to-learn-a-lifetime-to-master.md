---
layout: post
title: C&#58; A Minute to Learn... A Lifetime to Master
description: The C syntax can be deceptively simple at first. Yet it has features (such as pointers) that create complexity. We explore that a bit and uncover some resources that help "master" C.
---

{{ page.title }}
================

Last weekend I picked up the book [Expert C Programming: Deep C Secrets][deepc]
from a [local bookstore][adas] here in Seattle. The [C Programming language][c]
has arguably been the most influential programming language that I have learned.
It was the first language that I grew to love and *Expert C Programming*
inspired me to write up this short post chronicling my journey learning C, some
resources that I find valuable, as well as various other things.

## K&R: Know Your Roots

I read the famous [K&R][k&r] book back in high school during a blissful week at
the beginning of spring one year. I fell in love with the C programming
language. My views match up pretty well with what most of the community
already knows: it is one of the most beautifully written introductions to a
programming language ever. The most striking part is that the first edition it
came in at only 228 pages.

### Trivia Tidbits

- The K&R book popularized the standard of having one's [first program][first]
  write "Hello, world.
- The K&R book also popularized its [own brace style][k&rstyle], which then influenced the
  [brace style][1tbs] used in the Unix and Linux kernels.

### What Made it so Great?

Considering I read it so long ago, it's hard for me to determine why it made
such an impact on me. It might possibly have been the succinctness of it. Being
able to learn a language after reading ~200 pages allows one to program more
which was how I learned the best back in high school.

I also think a big part of it had to do with the examples in the book. Some of
the examples included converting an `int` to a binary/hexadecimal string, a
that takes in strings of numbers written in scientific notation and returning a
float. My personal favorite was one of the exercises from the first chapter:

> Write a program to check a C program for rudimentary syntax errors like
> unbalanced parentheses, brackets and braces. Don't forget about quotes, both
> single and double, escape sequences, and comments.

A full list of the exercises by chapter (as well as the solutions) can be found
on the [clc-wiki][clc]. If you actually want to try and solve them, don't cheat
and look at the solutions!

[deepc]: http://amzn.com/0131774298
[adas]: http://seattletechnicalbooks.com/
[k&r]: http://en.wikipedia.org/wiki/The_C_Programming_Language
[c]: http://en.wikipedia.org/wiki/C_(programming_language)
[first]: http://en.wikipedia.org/wiki/Hello_world
[k&rstyle]: http://en.wikipedia.org/wiki/Indent_style#K.26R_style
[1tbs]: http://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS
[clc]: http://clc-wiki.net/wiki/K%26R2_solutions
