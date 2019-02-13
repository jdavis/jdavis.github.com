---
id: home
layout: default
title: Home
description:
    Writings by Josh Davis, a software engineer based out of Seattle, on programming,
    science, and engineering.
---

{% include recompiled.html %}

<h2>Latest Post <i class="icon-double-angle-right"></i></h2>

<h4>
    <a href="{{ site.posts.first.url }}">
        {{ site.posts.first.date | date: "%d %B %Y" }}
    </a>
</h4>

{{ site.posts.first.content }}


{% include footer.html %}
