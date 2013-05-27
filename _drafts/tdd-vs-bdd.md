---
layout: post
title: The Difference Between TDD and BDD
css:
    - /css/code.css
---

{{ page.title }}
================

If you keep up-to-date with the latest software development practices, odds are
you have heard of Test-driven development (TDD) and Behavior-driven development
(BDD). This post is meant to explain what each practice means, provide examples,
and then contrast the two. Let's dig in and see what we learn.

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

<div class="gallery one">
    <figure>
        <img src="/img/tdd-vs-bdd/tdd-flowchart.png">
        <figcaption>Test-driven development flowchart.</figcaption>
    </figure>
</div>

### Example

Let's see an example of how a developer would do this.

Let's say a developer wants to write a function that does `this`. The normal
approach that TDD dictates is to use the function and then assert that the
result satisfies a certain value.

In this example, we're going to use a JavaScript testing framework called
[Mocha](http://visionmedia.github.io/mocha/). The tests might look something
like this:

{% highlight javascript %}

suite('Test', function(){
    setup(function (){
        // ...
    });

    suite('#f()', function (){
        test('equals -1 when not present', function (){
            assert.equal(-1, [1,2,3].indexOf(4));
        });
    });

    tearDown(function () {
        // ...
    });
});

{% endhighlight %}

The tests will obviously fail because the function hasn't been written yet. So
let's write that function to satisfy the tests. It might look something like
this:

{% highlight javascript %}

module.exports = function () {
    
};

{% endhighlight %}

Now when we run the tests, everything passes! We're ready to move onto our next
feature, right? **Nope.**

Before we explain what the issue is, let's look at what BDD is.

## Behavior-Driven Development

Alright, so what is BDD you ask? Well that's where the line gets a little fuzzy.
Some people will say it is similar to TDD, others will say that it **is** just
TDD but with better guidelines, or even a totally different approach to
developing.

Whatever the actual definition is, it doesn't matter that much. The main thing
to know is that **BDD is meant to eliminate issues that TDD might cause.**

In contrast to TDD, BDD is when we write *behavior* that then drives our
software development. Behavior might seem awfully similar to tests but the
difference is very subtle and important.

### Example

Let's take a look at our previous example of writing a function to do
`this`. When we wrote our tests using the TDD style, they had a flaw. Now let's
use BDD to see how our tests come out:

{% highlight javascript %}

describe('Test', function (){
    before(function(){
        // ...
    });

    describe('#f()', function (){
        it('should return -1 when not present', function (){
            [1,2,3].indexOf(4).should.equal(-1);
        });
    });

    after(function () {
        // ...
    });
});

{% endhighlight %}

At first they might look pretty similar but there are some key differences. The
first difference is just the wording. BDD uses a more verbose style so that it
can be read almost like a sentence.

This is what I meant by saying that BDD eliminates issues that TDD might cause.
The ability to read your tests like a sentence is a shift in how you will think
about your tests. The argument is that if you can read your tests fluidly, you
will *naturally* write better and more comprehensive tests.

## TDD vs BDD

As I mentioned in our TDD example, there was an issue in our test. The issue was
`this`.

We didn't have that issue when we wrote our BDD tests because of how natural
writing the BDD tests was. The fluidness helped our tests to be more
comprehensive and with less errors.

Now, this may seem like BDD is always superior to TDD. This certainly isn't the
case. The key to BDD is that it **might** prevent issues; it isn't guaranteed
to. Issues like poor organization, bad practices, etc. will still persist.
You'll just have a lower likely hood of writing bad tests.

## Conclusion

Neither style is better than the other, it really depends on the person. If you
find yourself writing incomplete unit tests using TDD, give BDD a shot. If you
are new to both TDD and BDD, I'd recommend you learn and use TDD first. The most
important part of these two styles is that it forces you to write tests for your
code. If you don't test your code, you probably should.

I'm not an expert on TDD or BDD by any means. I just didn't know the difference
myself so I investigated it a bit and this is what I came up with.

If you have suggestions and/or error corrections for this article, or even if
you just plain out disagree, I'd love to hear it all! Feel free to [contact
me](/about#contact). Thanks for reading! ^_^
