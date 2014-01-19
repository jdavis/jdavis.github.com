---
layout: post
title: C&#58; A Minute to Learn... A Lifetime to Master
description:
    The C syntax can be deceptively simple at first. Yet it has features (such
    as pointers) that create complexity. We explore that a bit and uncover some
    resources that help "master" C.
css:
    - /css/code.css
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
the examples included converting an `int` to a binary/hexadecimal string,
writing a function that takes in strings of numbers written in scientific
notation and returning a float. My personal favorite was one of the exercises
from the first chapter:

> Write a program to check a C program for rudimentary syntax errors like
> unbalanced parentheses, brackets and braces. Don't forget about quotes, both
> single and double, escape sequences, and comments.

A full list of the exercises by chapter (as well as the solutions) can be found
on the [clc-wiki][clc]. If you actually want to try and solve them, don't cheat
and look at the solutions!

## Dive Deep

Now back to the book that inspired me to write this post. *Expert C Programming*
covered some of the less well-defined parts of C.

### Declarations

It had a chapter just on C declarations and how to read them. If you spend any
amount of time programming C at all, you've more than likely come to realize
that sometimes determining what a variable is defined as is quite a difficulty.

The book has a short set of rules to follow to decipher a declaration yourself.
It also provides a small little program that will do the deciphering for you. If
you put in a declaration, it will output the English equivalent.

One of the best resources out there appears to be this [online C declaration to
English parser][cdecl] that will do the work for you. However, if you want to be
able to do this without relying on a website, definitely check out [this
guide][cdecl2].

### Arrays vs Pointers

Often a person will think that a pointer and an array are the same thing because
of the following:

{% highlight c %}

int a[] = {0, 1, 2, 3, 4};
int *p;

p = a;

if (a[2] == p[2]) {
    printf("Equal\n");
}

{% endhighlight %}

Running the above in a `main` function will print out `Equal` and stop. The
chapter goes more in depth on why they aren't the same with more examples.

The general idea is that `a` actually holds the data while `p` is holding the
*location* of where `a` is at. This means that `p[2]` can't just access it at
once, it must dereference the pointer to find out where `a` is stored, then
calculate the offset. While `a[2]` can calculate the offset immediately.

### History Lesson

The book also has a ton of little stories about certain parts of the C language.
For example it discusses how C came to have so many different ways to increment
an integer. The `i++` and `++i` came about because it was a single machine
instruction for the PDP-11.

That's just one example but the book was written in 1994 so it is packed with
other little history facts that make it really interesting.

### I Guess I'm an Expert Now

There are 11 chapters all together and each one looks at a crucial aspect of C
that might be a bit fuzzy. I definitely recommend checking it out if you like C.
I think it also would make a great reference book for when you get stuck on a
certain feature, say like declarations or pointers.

## Learning by Doing

It certainly goes without saying that writing a lot of code will help you to
learn the language. I certainly did this with C when I was learning it.

In addition to most of the exercises in K&R, I also did a lot of the [Project
Euler][euler] problems in C. Project Euler is just a list of problems that
intersect math and programming. Most often the problems can be solved using
brute force, but designing a better algorithm or understanding the problem more
usually can lead to a better solution.

My favorite part about Project Euler is that the only thing that it is very easy
to check if you are right or wrong. All the problems have a single number as the
result. Take the first problem for example:

> If we list all the natural numbers below 10 that are multiples of 3 or 5, we
> get 3, 5, 6 and 9. The sum of these multiples is 23.
>
> Find the sum of all the multiples of 3 or 5 below 1000.

The end result is just the sum; it doesn't matter how long it took to calculate
or what language you use. This makes it easy to experiment and work on solving
it first before optimizing a solution.

A [repository][projects] that I came across recently has been [trending on
GitHub][trending] for the last few days. The list of projects originally came
from [Martyr2 on dream-in-code][dream], but it is a repository of a guy that is
trying to implement most of the list in Python.

## Learning by Reading

There's a certain point where you can only learn so much from writing code. One
of the best ways to pick up new programming habits or techniques is best
achieved by reading other people's code.

C is so ancient that there are a ton of projects out there that you can use to
read. Here are a few of my favorites:

- [Plan 9][plan9] [source code][plan9src]. Plan 9 is an OS that was developed
  back in the early 90s. It uses a dialect of ANSI C so it shouldn't be too
  foreign.
- [dlmalloc][dlmalloc]. `dlmalloc` stands for "Doug Lea malloc" and is a
  reimplementation of `malloc`. It has a few benefits as well as a few
  shortcomings.

## Conclusion

Like the title says, the C programming language can be really simple to learn at
first. Yet like [Reversi][reversi], the flexibility of the language allows for
complexity to manifest itself. Mastering the language can take a very long time.

Since the language is so low level, it is very tightly dependent on the
implementation and hardware it is running on. Although the C standards are
supposed to limit these edge cases, they still exist.

I just read [an article][malloc] earlier today about what happens when
`malloc(0)` is called. As it turns out, it depends on the system what
`malloc(0)` will return.

C might seem quite scary considering it has been out for so long yet people
still have a ton of issues with it. I don't see it that way though.

Instead C is much like the game of chess, except the other player is the
computer. The more you master C the better you will get at countering the
computer and bending it to your will. It now becomes a game of mathematical
precision and a direct test of your knowledge of C and the computer.

It's certainly more magical and beautiful this way.


[deepc]: http://amzn.com/0131774298
[adas]: http://seattletechnicalbooks.com/
[k&r]: http://en.wikipedia.org/wiki/The_C_Programming_Language
[c]: http://en.wikipedia.org/wiki/C_(programming_language)
[first]: http://en.wikipedia.org/wiki/Hello_world
[k&rstyle]: http://en.wikipedia.org/wiki/Indent_style#K.26R_style
[1tbs]: http://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS
[clc]: http://clc-wiki.net/wiki/K%26R2_solutions
[cdecl]: http://cdecl.org/
[cdecl2]: http://unixwiz.net/techtips/reading-cdecl.html
[euler]: http://projecteuler.net/
[plan9]: http://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs
[plan9src]: http://plan9.bell-labs.com/sources/plan9/sys/src/
[dlmalloc]: http://g.oswego.edu/dl/html/malloc.html
[trending]: https://github.com/explore
[projects]: https://github.com/thekarangoel/Projects
[dream]: http://www.dreamincode.net/forums/topic/78802-martyr2s-mega-project-ideas-list/
[reversi]: https://en.wikipedia.org/wiki/Reversi
[malloc]: http://prog21.dadgum.com/179.html
