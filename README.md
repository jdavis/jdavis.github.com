joshldavis.com
==============

My personal web page: [joshldavis.com](http://joshldavis.com).

## Posts

- [The Beginning of a Beautiful Blogship][post1]
- [The Path to Dijkstra's Handwriting][post2]
- [The Difference Between TDD and BDD][post3]
- [The New Google Map's User Experience][post4]
- [The Legacy of the Clicky Keyboards][post5]
- [The Rise of the Gang of Four with Rust][post6]
- [Phil Zimmermann, Creator of PGP, Quote on Government & Crypto from 1996][post7]
- [Program to an Interface, Fool][post8]
- [Verification is Often Easier than Creation][post9]
- [Where Do I Sign Up to Change the World?][post10]
- [C: A Minute to Learn... A Lifetime to Master][post11]
- [My Favorite Elon Musk Quote][post12]
- [Never Save Anything for the Swim Back. Ever][post13]
- [The Differences Between Imperative and Functional Programming. Part 1.][post14]
- [GitHub + University: How College Coding Assignments Should Work][post15]
- [Doing Your Homework in LaTeX][post16]
- [My New Site to Demand Two Factor Auth Support][post17]
- [Vim Tab Madness. Buffers vs Tabs][post18]
- [A Beginner's Tutorial for knitr][post19]
- [Josh Uses This][post20]
- [Put Yourself Out There: The Myth of the Genius Programmer][post21]
- [GitHub + University: A Follow Up][post22]
- [Oh-my-zsh is the Disease and Antigen is the Vaccine][post23]
- [Heavy-handed HackerNews: Mods are Unnecessarily Editing Titles and Swapping URLs][post24]
- [The Similarity of the World in Gattaca and the World Elon Musk Envisions][post25]

## Running

It's easy to run everything locally to test it out. Either you can have plain
[Jekyll][jekyll] installed or you can use [Bundler][bundler] to manage
everything for you.

### Using Bundler

1. To install Bundler, just run `gem install bundler`.
2. Install dependencies in the [Gemfile][gemfile], `bundle install`.
3. Run Jekyll: `bundle exec jekyll serve --watch`. The `--watch` is optional and
   makes Jekyll watch for file changes.

### Using Vanilla Jekyll

1. Install Jekyll if you don't already have it: `gem install jekyll`.
2. Run Jekyll: `jekyll serve --watch`. The `--watch` is again optional.

## Testing
To run HTML proofer on the contents, just run:

```bash
$ bundle exec rake
```

## License

The following directories and their contents are Copyright Josh Davis. You may
not reuse anything therein without my permission:

- [\_posts](_posts/)

All other directories and files are [MIT Licensed](LICENSE). Feel free to use
the HTML and CSS as you please. If you do use them, a link back to
[http://github.com/jdavis/jdavis.github.com](http://github.com/jdavis/jdavis.github.com)
would be appreciated, but is not required.

[post1]: http://joshldavis.com/2013/05/11/beginning-of-a-beautiful-blogship/
[post2]: http://joshldavis.com/2013/05/20/the-path-to-dijkstras-handwriting/
[post3]: http://joshldavis.com/2013/05/27/difference-between-tdd-and-bdd/
[post4]: http://joshldavis.com/2013/06/02/google-maps-new-user-experience/
[post5]: http://joshldavis.com/2013/06/09/the-legacy-of-the-clicky-keyboards/
[post6]: http://joshldavis.com/2013/06/16/the-rise-of-the-gang-of-four-with-rust/
[post7]: http://joshldavis.com/2013/06/22/phil-zimmerman-creator-of-pgp-quote-on-government-and-crypto-from-1996/
[post8]: http://joshldavis.com/2013/07/01/program-to-an-interface-fool/
[post9]: http://joshldavis.com/2013/07/07/verification-is-often-easier-than-creation/
[post10]: http://joshldavis.com/2013/07/17/where-do-i-sign-up-to-change-the-world/
[post11]: http://joshldavis.com/2013/07/24/c-a-minute-to-learn-a-lifetime-to-master/
[post12]: http://joshldavis.com/2013/08/11/my-favorite-elon-musk-quote/
[post13]: http://joshldavis.com/2013/08/31/never-save-anything-for-the-swim-back/
[post14]: http://joshldavis.com/2013/09/30/difference-between-imperative-and-functional-part-1/
[post15]: http://joshldavis.com/2014/01/19/github-university-how-college-assignments-should-work/
[post16]: http://joshldavis.com/2014/02/12/doing-your-homework-in-latex/
[post17]: http://joshldavis.com/2014/03/15/demand-two-factor-auth-support/
[post18]: http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
[post19]: http://joshldavis.com/2014/04/12/beginners-tutorial-for-knitr/
[post20]: http://joshldavis.com/2014/05/15/uses-this/
[post21]: http://joshldavis.com/2014/06/13/put-yourself-out-there/
[post22]: http://joshldavis.com/2014/06/30/github-university-follow-up/
[post23]: https://joshldavis.com/2014/07/26/oh-my-zsh-is-a-disease-antigen-is-the-vaccine/
[post24]: https://joshldavis.com/2014/10/03/heavy-handed-hackernews/
[post25]: https://joshldavis.com/2014/10/11/the-similarity-of-the-world-in-gattaca-and-the-world-elon-musk-envisions/
