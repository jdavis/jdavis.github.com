---
id: home
layout: default
title: Home
description:
    The personal website for Josh Davis, contains about info, contact links,
    list of projects, and various articles.
---

<h2>Latest Post <i class="icon-double-angle-right"></i></h2>

<h4>
    <a href="{{ site.posts.first.url }}">
        {{ site.posts.first.date | date: "%d %B %Y" }}
    </a>
</h4>

{{ site.posts.first.content }}


{% include footer.html %}
