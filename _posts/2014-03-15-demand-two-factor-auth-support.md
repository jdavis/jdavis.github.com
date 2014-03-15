---
layout: post
title: My New Site to Demand Two Factor Auth Support
description:
    Two factor auth is available on a lot of websites but missing for some very
    important ones. We need to encourage best practice standards for all
    companies that have sensitive data. This website helps with that.
css:
    - /lib/lightbox/css/lightbox.css
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
    - /lib/lightbox/js/lightbox.js
---

{{ page.title }}
================

About a month ago I was going through the process of looking for a new domain
registrar to transfer my domains to. My number one criteria was a secure
registrar.

Although I don't own a [rare Twitter handle][@N], it was scary to think about
how the extortion of Naoki Hiroshima was possible just because of of a lost
domain name.

Although GoDaddy does support two factor auth, if Naoki hadn't been using it for
PayPal, his PayPal account would have been compromised as well.

I did a Google search for a list of sites with two factor auth and the results
were pretty dissatisfying. The first result was a website with a huge list of
sites that was barely usable.

This gave me an idea for my next mini-project.

## A Quick Explanation

Now if you don't know what [two factor auth][2fawiki] is, basically the idea is that it
gives you a second way to verify that you are you. The key is that this value
doesn't reside in your head or stored on a sticky note next to your monitor.

Instead the value is given to you (either through cryptographic means or through
a text/SMS). You then take this value and put it into whatever service you are
logging into.

Thus this gives a "second" factor to verify yourself by and giving you more
security.

## TwoFactorAuth.org

First, check it out here: [TwoFactorAuth.org][2fa]

In the 24 hours, I've spent the time creating a very simple website that has a
list of all the most common categories of websites like social media, finance,
email, etc. Then under each category there is a list of the most common websites
and whether or not they support two factor auth.

<div class="gallery medium">
    <a href="/img/2fa/twofactorauth.png" rel="lightbox[2fa]" title="TwoFactorAuth.org">
        <img src="/img/2fa/twofactorauth.png" width="640">
        <span>TwoFactorAuth.org</span>
    </a>
</div>
In addition to this, it provides a Twitter button that allows you to Tweet out
to the companies to demand that they support two factor auth. While it may be a
bit passive aggressive, it is a simplified version of the late Aaron Swartz'
idea for his website, [DemandProgress][demand].

## Open Source (of course)

The best part is that it is open source so you can add any website to it you
want. Just head over to the [GitHub repo][github] and make a pull request.

[swartz]: http://en.wikipedia.org/wiki/Aaron_Swartz
[demand]: http://www.demandprogress.org/
[2fa]: http://twofactorauth.org
[2fawiki]: http://en.wikipedia.org/wiki/Two-step_verification
[@N]: https://medium.com/cyber-security/24eb09e026dd
[github]: https://github.com/jdavis/twofactorauth
