---
layout: post
title: The Differences Between Imperative and Functional Programming
description: An explanation of imperative and functional programming paradigms using Python for imperative and Racket/Scheme for the functional language.
css:
    - /css/code.css
---

{{ page.title }}
================

This semester I'm taking a class called "Principles of Programming Languages."
It is the class in at my university where people are first exposed to functional
programming (assuming they don't have prior experience).

So far I am really enjoying it. The professor is really engaging and his
lectures are really interesting. We are using three books:

1. [Essentials of Programming Languages][eopl]
2. The classic: [The Little Schemer][schemer]
3. And even more of a classic: [Structure and Interpretation of Computer
   Programs][sicp]

I am having a lot of fun *finally* reading The Little Schemer. It has been on my
to-read list for awhile now. I'm also really enjoying reading SICP again. Back
in high school, I read the first few chapters while watching the
[lectures][lectures] given back in 1986.

Reading through it now, I've realized that a lot of it went over my head when I
was younger. I think I have a better appreciation for it now however.

Since this class uses Scheme/Racket, I have been programming a lot in
[Racket][racket] lately. It has been a really eye opening experience. I've
written some Scheme in high school and am quite use to closures/first class
functions from JavaScript, but not to the Racket extreme.

I wanted to learn a bit about what the differences between imperative languages
and functional languages are. Let's dig in.

## Programming Paradigm

A programming paradigm is a way of thinking and seeing the world when it comes
to programming. It borrows the Thomas Kuhn definition of paradigm and just
applies it to the practice of programming.

The four main programming paradigms, according to Wikipedia, are: imperative,
functional, object-oriented, and logic. Although object-oriented is pretty self
explanatory, I won't go into it nor will I discuss logic programming.

[eopl]: http://www.eopl3.com/
[schemer]: http://mitpress.mit.edu/sicp/
[sicp]: http://mitpress.mit.edu/sicp/
[lectures]: http://www.youtube.com/watch?v=2Op3QLzMgSY
[racket]: http://racket-lang.org/
