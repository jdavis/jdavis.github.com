---
layout: post
title:
    Self Documenting Vim Key Mappings
description:
    A little trick to be able to list and view all key mappings that are
    grouped. It works great for custom plugin mappings.
css:
    - /lib/lightbox/css/lightbox.css
    - /css/code.css
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
    - /lib/lightbox/js/lightbox.js
---

# {{ page.title }}

When configuring Vim with plugins, one of the common things that I like to do is
to dedicate a letter to a single Vim plugin (or a group of similar tasks).

An example of this is below where I have some key mappings for @tpope's [Fugitive
plugin][plugin-fugitive]:

{% highlight vim %}
" Fugitive mapping
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg :Ggrep
nmap <leader>gl :Glog<cr>
nmap <leader>gp :Git pull<cr>
nmap <leader>gP :Git push<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gbrowse<cr>
{% endhighlight %}

## The Problem

Most of the mappings and plugin functions are pretty straight forward and they
aren't hard to remember. Unfortunately I have some other key mappings that are a
bit harder to remember.

Take for example these [cscope][cscope-site] mappings:

{% highlight vim %}
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
{% endhighlight %}

What the hell do all of these mean? I took these from [cscope's Vim
mappings][cscope-maps] and unless I'm using them very, very regularly, it is
going to take some time to learn them all.

At first I wanted to make a plugin that would be able to help with this but I
was able to come up with a simpler solution even if it is a bit hacky.

## Solution

The first part is just to be able to view all of these similar mappings easily.
The best way I found to do this is just to run `:map binding_start` where you
substitute in what you want to look up.

In the case of Fugitive, we just run `:map <leader>g`. The output looks like the
following:

<div class="gallery large">
    <a href="/img/documenting/map.png" rel="lightbox[map]">
        <img src="/img/documenting/map.png" alt="Map output">
        <span>Output of `:map &lt;leader&gt;g`</span>
    </a>
</div>

As you can see, the output clearly shows the key mapping as well as the command
that is ran. For plugins like these, it is very easy to use it as a reference
for when you forget a mapping.

## Easy Access

The next part of the solution is to make that command easier to run. I like to
map it to `?` and match it with the previous mappings.

This means the mapping for Fugitive becomes:

{% highlight vim %}
" Fugitive reference
nmap <leader>g? :map <leader>g<cr>
{% endhighlight %}

## Self Documenting

Now what can we do about those cryptic mappings that don't make a lot of sense
like the cscope example?

Well since [`nmap`][vim-nmap] just runs a set of commands. We could just put
some superfluous text that won't affect the mapping yet show up when `:map
binding` is ran.

I gave it a try and it turns out it works pretty well. It makes the command a
bit messier (this can be tidied up by using whitespace) but this is what it
looks like:

{% highlight vim %}
nmap <C-\>c :ec 'Find all calls to function' <bar> cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :ec 'Find functions that call this function' <bar> cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :ec 'egrep search for the word under cursor' <bar> cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :ec 'Open filename under cursor' <bar> cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>g :ec 'Find all global definitions' <bar> cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :ec 'Find files that include the filename' <bar> cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>s :ec 'Find all references' <bar> cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :ec 'Find all instances to text' <bar> cs find t <C-R>=expand("<cword>")<CR><CR>
{% endhighlight %}

All we do is just [`echo`][vim-echo] out what the mapping actually does in
English. Then by using `<bar>`, it tells Vim to run the commands
together.

The end result is below:

<div class="gallery large">
    <a href="/img/documenting/map2.png" rel="lightbox[map]">
        <img src="/img/documenting/map2.png" alt="Final map output">
        <span>Cscope reference</span>
    </a>
</div>

Then the mapping to be able to run this command quickly is:

{% highlight vim %}
" Cscope reference
nmap <C-\>? :map <C-\><cr>
{% endhighlight %}

## Conclusion

That's it! I have a few other examples of this in my [`.vimrc`][vimrc], be sure
to give it a look to see other examples.

Hopefully you get some use out of this. It has made it a lot easier for me to
remember some of my more arcane key mappings.

Also, if there's a better way to do it, feel free to get in contact with me on
[Twitter]({{ site.data.accounts.twitter.site }}).


[vimrc]: https://github.com/jdavis/dotfiles/blob/master/.vimrc
[vim-nmap]: http://vimdoc.sourceforge.net/htmldoc/map.html
[vim-echo]: http://vimdoc.sourceforge.net/htmldoc/eval.html#:echo
[plugin-fugitive]: https://github.com/tpope/vim-fugitive
[cscope-site]: http://cscope.sourceforge.net/
[cscope-maps]: http://cscope.sourceforge.net/cscope_maps.vim
