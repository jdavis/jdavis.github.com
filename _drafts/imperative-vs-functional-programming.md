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

Since this class uses a functional programming language, I have been programming
a lot in [Racket][racket] lately. It has been a really eye opening experience.
I've written some [Scheme][scheme] (Racket is a dialect of Scheme) in high
school and am quite use to closures/first class functions from JavaScript, but
not to the Racket extreme.

I wanted to learn a bit about what the differences between imperative languages
and functional languages are so I figured I'd write up what I learned. Let's dig
in.

## Programming Paradigms

A programming paradigm is a way of thinking and seeing the world when it comes
to programming. It borrows the Thomas Kuhn definition of paradigm and just
applies it to the practice of programming.

The four main programming paradigms (according to Wikipedia) are: imperative,
functional, object-oriented, and logic. Although object-oriented is pretty self
explanatory, I won't go into it nor will I discuss logic programming.

## Imperative Programming

Imperative programming is the most dominant paradigm of all the others. It is
used in Assembly, Java, C, Python, Ruby, JavaScript, and many others. (Note:
Some programming languages have multiple paradigms)

It is characteristic of a sequence of steps/instructions that happen in order.
Common constructs to manipulate the flow of these instructions include `while`
statements, `for` loops, functions, and even the [dreaded goto (pdf)][goto].

Since it is the most dominant programming paradigm, it's what most people are
familiar with. Thus if you are anything like me, it just seems like the
"natural" way to program.

Since imperative programming is a list of steps that need to be executed, there
needs to be some way of keeping track of everything computed to that point.
That's (obviously) where variables come in. They are keeping the "state" of
where the program is at which then can control where the program should go to
next which continues to modify the state.

This sequence of state changes is often called a [side effect][effect]. The
reason it is called a side effect is because it has the potential to modify
the state, thus changing the flow of the program.

If the state of a program is sufficiently complex (lots of variables, scopes),
it can be hard to debug and understand. If the current code relies on the
previous state, which then relies on more previous state, it then is obvious
that the whole history of the program may need to be considered. However, proper
organization of code should prevent this.

[eopl]: http://www.eopl3.com/
[schemer]: http://mitpress.mit.edu/sicp/
[sicp]: http://mitpress.mit.edu/sicp/
[lectures]: http://www.youtube.com/watch?v=2Op3QLzMgSY
[racket]: http://racket-lang.org/
[scheme]: http://en.wikipedia.org/wiki/Scheme_(programming_language)
[goto]: http://www.cs.utexas.edu/users/EWD/ewd02xx/EWD215.PDF
[effect]: http://en.wikipedia.org/wiki/Side_effect_(computer_science)
