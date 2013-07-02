---
layout: post
title: Program to an Interface, Fool
css:
    - /css/code.css
---

{{ page.title }}
================

If you've read my post about how [the object-oriented paradigm is being
changed][rise] by languages such as [Rust][rust] and [Go][go], and if you've
seen my project of [Rust Design Patterns][rdp], then you've probably realized
that I've taken quite a liking to Rust.

In addition to this, over this past weekend, I finished reading the classic
[Design Patterns: Elements of Reusable Object-Oriented Software][gof]. All of
this has caused me to think quite a bit about one of the core principles in the
book:

> Program to an 'interface', not an 'implementation'.

## What does it mean?

First you need to understand what interface and implementation mean. To put it
shortly, an *interface* is just what we call a set of methods that an object
responds to.

An *implementation* is where the code and logic for the interface resides.

In essence, the principle is advocating that when we write a function, or
method, that we choose to reference an interface instead of something more
concrete like a class.

## Programming to an Implementation

First let's look at what happens when you don't follow this principle.

Imagine you are Guy Montag from the book, [Fahrenheit 451][451] (F451 from here
on out). As everyone knows, books in F451 are forbidden. It's the job of
firefighters to set them on fire whenever they come across them. Therefore
thinking in terms of OOP, a book has a method called `burn()`.

Books aren't the only things that can burn. If we have another object say a Log
of wood, it also has a method called `burn()`. So let's write this code in Rust
to see how it turns out without "programming to an 'interface'":

{% highlight rust %}

struct Book {
    title: @str,
    author: @str,
}

struct Log {
    wood_type: @str,
}

{% endhighlight %}

So this pretty straight forward. We just create two different structs to
represent a Book and a Log. Now let's implement the methods for our structs:

{% highlight rust %}

impl Log {
    fn burn(&self) {
        println(fmt!("The %s log is burning!", self.wood_type));
    }
}

impl Book {
    fn burn(&self) {
        println(fmt!("The book %s by %s is burning!", self.title, self.author));
    }
}

{% endhighlight %}

Now that a `Log` and a `Book` both have `burn()` methods, let's set them on
fire.

First let's set the log on fire:

{% highlight rust %}

fn start_fire(lg: Log) {
    lg.burn();
}

fn main() {
    let lg = Log {
        wood_type: @"Oak",
        length: 1,
    };

    // Burn the oak log!
    start_fire(lg);
}

{% endhighlight %}

Everything works great and we get the output "The Oak log is burning!".

Now since we've already written the `start_fire` function, can we pass in a book
as well since they both have `burn()` methods? Let's try:

{% highlight rust %}

fn main() {
    let book = Book {
        title: @"The Brothers Karamazov",
        author: @"Fyodor Dostoevsky",
    };

    // Burn the oak log!
    start_fire(book);
}

{% endhighlight %}

Does it work? **Nope.** Instead we get the error:

> mismatched types: expected `Log` but found `Book` (expected struct Log but
> found struct Book)

Which completely makes sense, because we wrote our function to expect a `Log`
struct but we passed it a `Book` struct. How can we fix this? Well we can write
the function again but this time take in a `Book` struct as an argument. That
isn't a good solution at all, however. We now have the exact same function in
two places and if one changes, we need to manually change the other.

Let's take a look at how "programming to an 'interface'" can fix this.

## Programming to an Interface

Let's take the structs that we had previously, but this time let's add an
interface. In Rust, interfaces are called **traits**:

{% highlight rust %}

struct Book {
    title: @str,
    author: @str,
}

struct Log {
    wood_type: @str,
}

trait Burnable {
    fn burn(&self);
}

{% endhighlight %}

Now in addition to the two structs, we also have an interface called `Burnable`.
This defines just a single method called `burn()`. Let's implement the interface
for each struct now:

{% highlight rust %}

impl Burnable for Log {
    fn burn(&self) {
        println(fmt!("The %s log is burning!", self.wood_type));
    }
}

impl Burnable for Book {
    fn burn(&self) {
        println(fmt!("The book \"%s\" by %s is burning!", self.title, self.author));
    }
}

{% endhighlight %}

So far it doesn't look that much different. This is where the power of
programming to an interface comes in:

{% highlight rust %}

fn start_fire<T: Burnable>(item: T) {
    item.burn();
}

{% endhighlight %}

Rather than expecting a Book object or a Log object, we just take in any object
with any type (we call the type `T`) that implements the `Burnable` interface.
This leaves us with the following main function:

{% highlight rust %}

fn main() {
    let lg = Log {
        wood_type: @"Oak",
    };

    let book = Book {
        title: @"The Brothers Karamazov",
        author: @"Fyodor Dostoevsky",
    };

    // Burn the oak log!
    start_fire(lg);

    // Burn the book!
    start_fire(book);
}

{% endhighlight %}

Now as we'd expect, we get the following output:

> The Oak log is burning!

> The book "The Brothers Karamazov" by Fyodor Dostoevsky is burning!

Which is exactly as we wanted.

## Conclusion

By following the principle behind "programming to an 'interface'", we were able
to write a function once that is now completely reusable across any object that
implements the `Burnable` interface. Since a lot of programmers are paid by the
hour, the more time we spend writing reusable code and the less time we spend
maintaining old code, the better.

This is a very powerful principle for this reason.

It might not always be possible to program to an interface, but often it makes
writing reusable and elegant code easier. It provides a very nice abstraction
and makes working with your code a lot easier.

[rust]: http://www.rust-lang.org/
[go]: http://golang.org/
[rise]: http://joshldavis.com/2013/06/16/the-rise-of-the-gang-of-four-with-rust/
[rdp]: http://joshldavis.com/rust-design-patterns/
[gof]: http://amzn.com/0201633612
[451]: http://en.wikipedia.org/wiki/Fahrenheit_451
