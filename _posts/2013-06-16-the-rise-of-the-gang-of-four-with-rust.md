---
layout: post
title: The Rise of the Gang of Four with Rust
description:
    How a classic book on OOP is being brought back to life with the Rust
    programming language.
css:
    - /css/code.css
---

{{ page.title }}
================

Since I've been to Seattle, I've had a lot of time to catch up on reading. One
of the books that I've been reading has been well regarded since it was released
in 1994.

[Design Patterns: Elements of Reusable Object-Oriented Software][gof] (also
called the Gang of Four book) is considered to be one of the best books when it
comes to design patterns. It is often touted as a classic and I always approach
such books skeptically. However, the first two chapters absolutely blew me away.
This post is mainly about the first chapter and how it has changed my view of
programming languages as I took up learning [Rust][rust].

## The Standard Object-Oriented Paradigm

Before I read this book, when I thought of [object-oriented programming
(OOP)][oop], the languages that I thought of were usually Java, C++, Python, and
Ruby (and according to [GitHub][popular], they are the four most popular OOP
languages, besides PHP) The interesting part is that all four of these languages
use the same notion of OOP with little twists added on.

Using these four languages, let's look at some common terms that are used when
trying to understand OOP for the first time.

Also, feel free to skim through this section on the standard paradigm if you are
familiar with OOP in Java, C++, Python, and Ruby. The crux of this post is in
the next section on the new paradigm.

### Types & Classes

A **type** is a name given to an object to distinguish what kind it is. In OOP
languages, there are many different kinds of types. With Java, the types can be
primitive types, which means they are built into the language, like `int` and
`boolean`. Or they can be names given to the class an object is. Here's what
determining an object's type looks like in Python:

{% highlight cpp %}
s = "Hi there"
x = 9
o = object()

if type(s) is str:
    print "A string."
if type(x) is int:
    print "An int."
if type(o) is object:
    print "An object."
{% endhighlight %}

Now in Java:

{% highlight java %}
public class Cat {}
public class MaineCoon extends Cat {}

public class Main {
    public static void main(String argv[]) {
        Cat c;
        MaineCoon kitty = new MaineCoon();

        // Will output: Kitty type = class MaineCoon
        System.out.println("Kitty type = " + kitty.getClass());

        c = (Cat) kitty;

        // Will output: C type = class MaineCoon
        System.out.println("C type = " + c.getClass());
    }
}
{% endhighlight %}

As you can see, the idea of a type is used in these languages as a one-to-one
mapping between types and objects. In other words, an object can only have one
type.

I group the terms type and class together because they can be pretty
interchangeable when talking about objects. However, sometimes a class is only
referred to when talking about non-primitive objects.

Using our example, a **class** would only refer to `Cat` or `MaineCoon`. And
primitives such as `int` and `boolean` have no class.

### Signature

A **signature** is the term used to describe what a function or method is called,
what it takes in as parameters, and what it returns.

In Ruby signatures look like this:

{% highlight ruby %}
def gcd(a, b)
    # ...
end
{% endhighlight %}

Ruby is dynamically typed so none of the variable types need to be mentioned.
Java on the other hand is not dynamically typed. Thus a signature in Java looks
like this:

{% highlight java %}
public class Algorithms {
    public int gcd(int a, int b) {
        // ...
    }
}
{% endhighlight %}

The signature in Java looks different than the one in Ruby because the types
need to be declared. The first type we see is that the method called `gcd`
returns an `int` and takes two `ints` as arguments.

### Interface

An **interface** is a set of signatures that an object must respond to when
implementing it. This is a way of guaranteeing that an object has a method
defined for it.

The only programming language with explicit support for interfaces is Java. One
can create an interface with C++ by just defining a class without providing any
code. A similar thing can be achieved in Python by creating a class but just
throwing a [NotImplementedError][err] as well as Ruby as explained
[here][ruby-errors] (although using "interfaces" in Python and Ruby could
arguably be a bad thing).

Java interfaces look like this:

{% highlight java %}
public interface Sloth {
    public void climb();
    public void eat();
}
{% endhighlight %}

Now any object that implements the `Sloth` interface is guaranteed to respond to
the two methods: `climb` and `eat`.

### Polymorphism

Polymorphism is considered to be one of the tenets of OOP. **Polymorphism** is
when an object can take on multiple forms. This sounds strange but you've
already seen an example of this but let's look at it more explicitly.

{% highlight java %}
public class Dragon {
    public void roar() {
        System.out.println("Roar!");
    }
}

public class FireBreathingDragon extends Dragon {
    public void roar() {
        System.out.println("Roar + a ton of flames!");
    }
}

public class DragonTrainer {
    public void train(Dragon dragon) {
        dragon.roar();
    }
}

public class Main {
    public static void main(String argv[]) {
        DragonTrainer trainer = new DragonTrainer();
        Dragon spike = new Dragon();
        FireBreathingDragon toothless = new FireBreathingDragon();

        // Prints out: Roar!
        trainer.train(spike);

        // Prints out: Roar + a ton of flames!
        trainer.train(toothless);
    }
}
{% endhighlight %}

As you can see, when we create a `DragonTrainer`, the trainer doesn't have to know
about `FireBreatingDragon`, it only has to know about the class `Dragon`. What
happens is that since `FireBreatingDragon` extends `Dragon`, it just gets casted
to it during the `train` method and calls the appropriate method.

### Inheritance

**Inheritance** is almost exactly what it sounds like, if one has an object that
extends from another, it will now have all of the same signatures and instance
variables.

Taking our Dragon example from earlier, if we left off the implementation for
the `roar` method in our `FireBreatingDragon`, then it would just output "Roar!"
again because it inherits the `roar` method from `Dragon`.

## An Object-Oriented Paradigm Shift

The Gang of Four book starts off in Chapter One by defining each of the terms I
have listed above. As I read it, I figured it would all be review, yet I was
getting very confused by the definitions. I re-read the chapter and my mind was
forever changed.

<div class="gallery xsmall">
    <figure>
        <img src="/img/gof/mind-blown.gif" width="300">
        <figcaption>This really did happen to my brain.</figcaption>
    </figure>
</div>

Let's take a look at each of those definitions from earlier and see how they
compare. I've switched around the order a bit to aid in explanation.

### Signature

In the Gang of Four, a signature is exactly what it is in Java, Python, and
others. A **signature** still refers to the name of a method/function, its
return type, and its parameters. Look above for an example.

### Interface

Once again, an **interface** has no difference either. It is still a set of
signatures that an object must respond to.

You may be wondering now why I thought that the Gang of Four was such a
mind-blowing read, well hopefully the next set of terms as well as the examples
in [Rust][rust] will explain that.

### Types & Classes

In the Gang of Four, a **type** is just a name to denote a particular interface.
If an object has a certain type, then it responds to all the requests for that
interface.

This doesn't seem that revolutionary, but what does this imply? Well this means
that an object can have multiple types. An object can actually have as many
types as it wants, it just needs to implement more interfaces.

Let's take a look at what this looks like in [Rust][rust]. If your Rust is a
little rusty (heh heh) or if you don't know it, take a look at the
[tutorial][tut] that is provided. It is an excellent introduction to the
language. Anywho, here's what it looks like:

{% highlight rust %}

trait Mammal {
    fn pet_fur(&self);
}

trait Flyable {
    fn fly(&self);
}

struct Bat;

impl Mammal for Bat {
    fn pet_fur(&self) {
        println("You pet the bat.");
    }
}

impl Flyable for Bat {
    fn fly(&self) {
        println("The bat flies away!");
    }
}

{% endhighlight %}

The first thing that you probably noticed is the keyword `trait`, this is what
Rust calls a set of signatures, also known as an interface. Then we implement
those interfaces in the `impl` section based on the `Bat` struct.

This paradigm is completely different than the standard idea of a type that is
used in Java, C++, Python, and more.

#### Classes

Next is the idea of a **class**. In the Gang of Four, a class is just an
object's implementation. A class also specifies the object's internal data,
representation and it defines the operations the object can perform.

Although Rust doesn't use the keyword `class`, following the definition in the
last paragraph, a class could best be described as a `struct` with
implementations. Although it isn't a class in the traditional sense (there is no
*class* based inheritance), it can sort of be viewed as one ([better analysis on
classlessness in Rust as well as Go][classless])).

### Polymorphism

In Rust the idea of **polymorphism** is made possible all through the type
system. The forms that an object can take are all dependent on the types of an
object, in other words, the interfaces it implements.

### Inheritance

As I mentioned, Rust doesn't have the idea of *class* based inheritance. Instead
it has the idea of *trait inheritance*.

When creating a trait, it's possible to inherit other traits to extend
functionality.

{% highlight rust %}

trait Shape {
    fn area(&self) -> float;
}

struct Rectangle {
    width: float,
    height: float,
}

impl Shape for Rectangle {
    fn area(&self) -> float {
        return self.width * self.height;
    }
}

trait Round : Shape {
    fn center(&self) -> Point;
}

struct Point {
    x: float,
    y: float
}

struct Circle {
    radius: float,
    center: Point
}

impl Round for Circle {
    fn center(&self) -> Point {
        return self.center;
    }
}

impl Shape for Circle {
    fn area(&self) -> float {
        return 3.14 * self.radius * self.radius;
    }
}

{% endhighlight %}

This example shows that if we create a `Shape` trait that has one signature, an
`area` method, we can then use that trait and implement it for subsequent
structs. Since the area formula for a `Rectangle` is different than a `Circle`,
we can represent that easily with type inheritance by creating a new type called
`Round`. Since the `Round` trait inherits the `Shape` trait as well, we need to
implement both traits for the `Circle` struct.

## Conclusion

Rust is only at version 0.6. Mozilla wants to get a stable 1.0 version out by
the end of the year so there is no telling what might change.

The interesting thing is that Rust is following the same pattern that [Go][go]
took as well. Go is very similar to Rust in that it has interface inheritance
and no classes.

Although the Gang of Four book certainly wasn't the first to come up with the
definitions of an interface, type, and class, it was the first place I came
across the new ideas. Since these ideas are a radical shift from the previous
paradigm, I can't help but think that the Gang of Four has influenced Rust and
Go, the two languages that I'm most excited to see evolve. It's often said that
"history repeats itself", yet I can't help but feel that great design also
follows the same cyclic pattern.

[gof]: http://amzn.com/0201633612
[rust]: http://www.rust-lang.org
[go]: http://www.go-lang.org
[oop]: https://en.wikipedia.org/wiki/Object-oriented_programming
[popular]: https://github.com/languages
[java]: https://en.wikipedia.org/wiki/Java_(programming_language)
[err]: http://docs.python.org/2/library/exceptions.html#exceptions.NotImplementedError
[ruby-errors]: http://metabates.com/2011/02/07/building-interfaces-and-abstract-classes-in-ruby/
[tut]: http://static.rust-lang.org/doc/tutorial.html
[classless]: https://lwn.net/Articles/548560/
