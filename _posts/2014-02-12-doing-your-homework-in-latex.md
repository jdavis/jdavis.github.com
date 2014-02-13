---
layout: post
title: Doing Your Homework in LaTeX
description:
    Using LaTeX to write up your homework for university isn't as hard as some
    people think. In fact it has quite a few benefits, I discuss them here.
css:
    - /css/code.css
    - /lib/lightbox/css/lightbox.css
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
    - /lib/lightbox/js/lightbox.js
---

{{ page.title }}
================

It is a common occurrence for other students to comment on my homework whenever
I turn it in for one of my classes.

Below are a few screenshots of problems that I've done in the past. The complete
[LaTeX][latex] file (and the pdf output) can be found in my repository,
[latex-homework-template][repo]:

<div class="gallery large">
    <a href="/img/latex/latex1.png" rel="lightbox[latex]" title="Cover page">
        <img src="/img/latex/latex1.png" width="180">
        <span>Cover page</span>
    </a>

    <a href="/img/latex/latex2.png" rel="lightbox[latex]" title="Example problem 2">
        <img src="/img/latex/latex2.png" width="180">
        <span>Algorithm problems</span>
    </a>

    <a href="/img/latex/latex3.png" rel="lightbox[latex]" title="Example problem 3">
        <img src="/img/latex/latex3.png" width="180">
        <span>Complexity problems</span>
    </a>

    <a href="/img/latex/latex4.png" rel="lightbox[latex]" title="Example problem 4">
        <img src="/img/latex/latex4.png" width="180">
        <span>Statistics problem</span>
    </a>
</div>

If I didn't know how easy it was and the benefits that I get from typesetting my
homework, I'd probably ask as well.  However, I'd argue that using LaTeX to type
up homework has made me a far better student than when I used to handwrite my
homeworks.

And that is something that I care a lot about.

## The Benefits

I can summarize the benefits like so:

1. **It can be kept in Source Control.**
   Handwriting can't be stored in a version control system; once you erase
   something, it's gone.

2. **You can see your homework materialize in front of you.**
   Seeing the results and the equations in their complete LaTeX-glory is a very
   powerful way to conceptualize things. There's just something different about
   the way things look so perfect that makes the subject easier to understand.

3. **It's *very* neat & tidy.**
   Although my [handwriting has improved][handwriting] quite a bit, I still find
   myself slipping back into a rushed, messy script from the past. LaTeX gives
   zero doubt that the professor/TA will be able to read my solutions.

## About LaTeX

### A Very Short History

[Donald Knuth][knuth], a legendary Computer Scientist as well as one of my
favorites, is well known for the system that he created called just [TeX][tex].

It is a piece of typesetting software that aids in writing documents and
formulas. The power comes from the fact that the document that you write is
plain source code.

The code that you write is then "typeset" into the final document in whatever
form you wish.

### Example

Here's an example of some basic LaTeX code:

{% highlight tex %}

This gives us:

\[
    \begin{split}
        \sum_{i = 1}^{n} {x_i (Y_i - \hat{\beta_1} x_i)}
        &= \sum_{i = 1}^{n} {x_i Y_i}
        - \sum_{i = 1}^{n} \hat{\beta_1} x_i^2
        \\
        &= \sum_{i = 1}^{n} {x_i Y_i}
        - \hat{\beta_1}\sum_{i = 1}^{n} x_i^2
    \end{split}
\]

Solving for \(\hat{\beta_1}\) gives the final estimator for \(\beta_1\):

\[
    \begin{split}
        \hat{\beta_1}
        &= \frac{
            \sum {x_i Y_i}
        }{
            \sum x_i^2
        }
    \end{split}
\]
{% endhighlight %}

With the output looking like below:

<div class="gallery large">
    <a href="/img/latex/example.png" rel="lightbox[latex]" title="Example output">
        <img src="/img/latex/example.png" width="480">
        <span>Result of above code</span>
    </a>
</div>

## Using the Template

I've created a GitHub repository, [latex-homework-template][repo], just for my
homework template that I've been using ever since I started. I found it online
and used it as a base to start my template. I can't find the original source now
so I apologize if I didn't credit you.

To use it, just download the [homework.tex][homework.tex] file and start
editing. Once you need to typeset it, you'll need LaTeX [here][install].

After that, you just need to compile it and you'll get your output. There are
tons of different resources that I've found useful in learning LaTeX:

1. [TeX StackExchange][stackexchange]

2. [TeX Wikibook][wikibook]

## Affect on Performance

I have a solid set of anecdotal evidence in favor of using LaTeX for writing up
my homework.

In all the classes that I've used LaTeX, I've come out of the class with a very
strong understanding of the material as well as a good grade. Although I'm not a
big fan of grades (like at all), I know it matters to some people.

This might have to do with the fact that doing the homework in LaTeX takes
longer. It might have to do with the fact that I perfect the appearance and
spend a lot more time looking at the subject.

The most likely reason is a combination of all that I previously mentioned plus
other factors. I'm usually one to always want to quantify something, but in this
case, I know it helps; that's all I need.

## Learning Curve

There definitely is a learning curve when it comes to trying to use LaTeX for
homework. I felt that it was definitely worth the effort unlike how it might
seem to some students.

I reasoned that when I go to graduate school, I will want to use it there. I
also know how pervasive it is in textbooks. Since I love to [read
textbooks][textbooks] so much, I wanted to see what it took to write them so
elegantly. I may even want to write one in the future; we'll have to see =]

To me it seemed like a small tradeoff for the great benefits that it provided.

## Conclusion

I cannot recommend using LaTeX for your homework enough.

The benefits go a long way. It helps you learn the material and in a way that
isn't as easily achieved when just using pencil and paper.

LaTeX is also widely used in academia and learning about the tool is almost
essential if you wish to go to graduate school.

Once I graduate from university, I plan on releasing all my code for the last
three semesters as open source. It includes all my LaTeX code which has really
accumulated over the last year. It should provide a nice resource for others.

In the meantime, hopefully if you start using LaTeX for your homework, you won't
be able to resist doing it early because of how fun it is. Well, at least it was
fun for me =]

[latex]: http://en.wikipedia.org/wiki/LaTeX
[handwriting]: http://joshldavis.com/2013/05/20/the-path-to-dijkstras-handwriting/
[repo]: https://github.com/jdavis/latex-homework-template
[knuth]: http://en.wikipedia.org/wiki/Donald_Knuth
[tex]: http://en.wikipedia.org/wiki/TeX
[textbooks]: https://www.goodreads.com/review/list/6593701?shelf=favorites-textbooks
[install]: http://latex-project.org/ftp.html
[homework.tex]: https://github.com/jdavis/latex-homework-template/blob/master/homework.tex
[wikibook]: http://en.wikibooks.org/wiki/LaTeX
[stackexchange]: http://tex.stackexchange.com/
