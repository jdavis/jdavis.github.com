---
layout: post
title: The Difference Between TDD and BDD
description: Explanation of the difference between TDD and BDD using an example in JavaScript.
css:
    - /css/code.css
---

{{ page.title }}
================

If you keep up-to-date with the latest software development practices, odds are
you have heard of [Test-driven development (TDD)][tdd] and [Behavior-driven
development (BDD)][bdd]. This post is meant to explain what each practice means,
provide examples, and then contrast the two. Let's dig in and see what we learn.

[tdd]: http://en.wikipedia.org/wiki/Test-driven_development
[bdd]: http://en.wikipedia.org/wiki/Behavior-driven_development

## Test-Driven Development

When I first heard about TDD, the idea seemed to be pretty simple. Just by doing
a little word swizzling, obviously TDD is when you have tests that drive your
software development.

If we were to unpack the definition of TDD a bit more, we'd see that it is
usually broken up into five different stages:

1. First the developer writes some tests.
2. The developer then runs those tests and (obviously) they fail because none of
   those features are actually implemented.
3. Next the developer actually implements those tests in code.
4. If the developer writes his code well, then the in next stage he will see his
   tests pass.
5. The developer can then refactor his code, add comments, clean it up, as
   he wishes because the developer knows that if the new code breaks something,
   then the tests will alert him by failing.

The cycle can just continue as long as the developer has more features to add. A
flowchart is given below of this cycle:

<div class="gallery small">
    <figure>
        <img src="/img/tdd-vs-bdd/tdd-flowchart.png" width="460">
        <figcaption>Test-driven development flowchart.</figcaption>
    </figure>
</div>

### Example

Let's see an example of how a developer would do this. The complete source code
for this article is located in this repository: [tdd-vs-bdd][repo]. Feel free to
clone it and run it yourself by issuing the commands `npm install && grunt`.

Let's say a developer wants to write a function that does something simple, like
calculate a factorial (obviously a rather contrived example but it will show us
the difference between TDD and BDD). The normal approach that TDD dictates is to
use the function and then assert that the result satisfies a certain value.

In this example, we're going to use a JavaScript testing framework called
[Mocha](http://visionmedia.github.io/mocha/). The tests might look something
like this:

{% highlight javascript %}

var assert = require('assert'),
    factorial = require('../index');

suite('Test', function (){
    setup(function (){
        // Create any objects that we might need
    });

    suite('#factorial()', function (){
        test('equals 1 for sets of zero length', function (){
            assert.equal(1, factorial(0));
        });

        test('equals 1 for sets of length one', function (){
            assert.equal(1, factorial(1));
        });

        test('equals 2 for sets of length two', function (){
            assert.equal(2, factorial(2));
        });

        test('equals 6 for sets of length three', function (){
            assert.equal(6, factorial(3));
        });
    });
});

{% endhighlight %}

The tests will obviously fail because the function hasn't been written yet. So
let's write that function to satisfy the tests. It might look something like
this:

{% highlight javascript %}

module.exports = function (n) {
    if (n < 0) return NaN;
    if (n === 0) return 1;

    return n * factorial(n - 1);
};

{% endhighlight %}

Now if we run the tests, we can see that all of them pass! This is how TDD
works. Now let's take a look at BDD to see how it is different.

## Behavior-Driven Development

Alright, so what is BDD you ask? Well that's where the line gets a little fuzzy.
Some people will say it is similar to TDD, others will say that it **is** just
TDD but with better guidelines, or even a totally different approach to
developing.

Whatever the actual definition is, it doesn't matter that much. The main thing
to know is that **BDD is meant to eliminate issues that TDD might cause.**

In contrast to TDD, BDD is when we write *behavior &amp; specification* that
then drives our software development. Behavior &amp; specification might seem
awfully similar to tests but the difference is very subtle and important.

### Example

Let's take a look at our previous example of writing a function to calculate the
factorial for a number.

{% highlight javascript %}

var assert = require('assert'),
    factorial = require('../index');

describe('Test', function (){
    before(function(){
        // Stuff to do before the tests, like imports, what not
    });

    describe('#factorial()', function (){
        it('should return 1 when given 0', function (){
            factorial(0).should.equal(1);
        });

        it('should return 1 when given 1', function (){
            factorial(1).should.equal(1);
        });

        it('should return 2 when given 2', function (){
            factorial(2).should.equal(2);
        });

        it('should return 6 when given 3', function (){
            factorial(3).should.equal(6);
        });
    });

    after(function () {
        // Anything after the tests have finished
    });
});

{% endhighlight %}

The main difference is just the wording. BDD uses a more verbose style so that
it can be read almost like a sentence.

This is what I meant by saying that BDD eliminates issues that TDD might cause.
The ability to read your tests like a sentence is a cognitive shift in how you
will think about your tests. The argument is that if you can read your tests
fluidly, you will *naturally* write better and more comprehensive tests.

Although this example is very simple and doesn't illustrate it, BDD tests should
be more focused on the features, not the actual results. Often you'll hear that
BDD is to help **design** the software, not test it like what TDD is meant to
do.

## TDD vs BDD

The choice between TDD and BDD is a complicated one. It depends on if there is
an appropriate testing framework for your given target language, what your
coworkers are comfortable with, and sometimes other factors.

Some argue that BDD is always better than TDD because it has the possibility of
eliminating issues that might arise when using TDD.

The key to BDD is that it **might** prevent issues; it isn't guaranteed to.
Issues like poor code organization, bad design practices, etc. will still
persist. You'll just have a lower likely hood of writing bad tests and thus have
more robust features.

## Conclusion

Neither style is better than the other, it really depends on the person. A
person that knows how to write great TDD tests can have just as few bugs as
someone that knows how to write great BDD tests. If you find yourself writing
incomplete tests using TDD and want to design better software? Then give BDD a
shot. If you are new to both TDD and BDD, I'd recommend you learn and use TDD
first. The most important part of these two styles is that it forces you to
write tests for your code. If you don't test your code, you need to.

I'm not an expert on TDD or BDD by any means. I just didn't know the difference
myself so I investigated it a bit and this is what I came up with. Once again,
the code for the example in this post is located in this repository:
[tdd-vs-bdd][repo].

If you have suggestions and/or error corrections for this article, or even if
you just plain out disagree, I'd love to hear it all! Feel free to [contact
me](/about#contact). Thanks for reading! ^\_^

[repo]: https://github.com/jdavis/tdd-vs-bdd
