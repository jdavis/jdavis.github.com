---
layout: post
title: GitHub &#43; University&#58; How College Coding Assignments Should Work
description:
    Looking at how to use GitHub for college programming assignments and how to
    simplify the workflow.
css:
    - /lib/lightbox/css/lightbox.css
js:
    - //ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js
    - /lib/lightbox/js/lightbox.js
---

{{ page.title }}
================

This semester (Spring 2014), I'm a Teaching Assistant (TA) for a course that I
took last semester called "Principles of Programming Languages." It was a very
enjoyable class and I have always been interested in programming languages. I
felt that being a TA would be a great way to explore the learning process and
subject matter more deeply.

## An Idea

Through out my entire college career, all programming assignments have had to be
submitted through [BlackBoard][bb]. To be as diplomatic as possible, BlackBoard
does a lot of things to help students & teachers. Unfortunately it does not do a
single one of them well.

The normal way to submit coding assignments is to have homework assigned through
BlackBoard and to have to code up the solutions and then zip them up and submit
them using the web interface.

### BlackBoard Issues

There are many different issues with this.

1. The first and most obvious is that it is tedious for each party (TA & the
   student) to zip and extract code.

2. It can't be automated (painlessly). BlackBoard has a series of iframes that
   make it incredibly hard to automate submission or retrieval of homework.

3. Code should not be stored in zip files anymore. Distributing code is a solved
   problem by using version control systems.

## GitHub to the Rescue

[Lorand][lorand], one of the other TA's, and I both came to the conclusion that
using [GitHub][gh] would be an interesting experiment. We were both very
experienced with using Git as well as GitHub so we wanted to brainstorm how we
could get a class of considerable size to do this.

The great part is that GitHub provides plenty of opportunities for students and
teachers to get free access to normally pay-only features though the [GitHub
Education][edu] section.

Using this, the professor reached out to GitHub and was able to setup an
Organization with 125 private repositories for free.

After typing up a little README with the course info, a guide to using Git +
GitHub, as well as shamelessly stealing the [Half-Life][hl] logo, we had an
organization that was ready for the semester: [ComS342-ISU][coms342].

## Setting It Up

The first obstacle was that we wanted each student to have a private repository
that would contain all their solutions in individual folders. We wanted the
repositories to be only visible to the student it belonged to as well as the
TA's and instructor.

I knew that I would never want to individually create 50+ repositories and setup
the correct push/pull access so I turned to [GitHub's API][api] +
[NodeJS][node].

### Automating Using the API

It only took a few hours but within short time I had a very simple web
application that would allow the student to connect using their GitHub account
through GitHub's OAuth.

<div class="gallery xlarge">
    <a href="/img/cs342/app0.png" rel="lightbox[bad]" title="Step one of the app">
        <img src="/img/cs342/app0.png" height="250">
        <span>Signing in with GitHub</span>
    </a>

    <a href="/img/cs342/app1.png" rel="lightbox[bad]" title="Step two of the app">
        <img src="/img/cs342/app1.png" height="250">
        <span>Joining the Class</span>
    </a>

    <a href="/img/cs342/app2.png" rel="lightbox[bad]" title="Step three of the app">
        <img src="/img/cs342/app2.png" height="250">
        <span>Successfully enrolling</span>
    </a>
</div>

The application would then ask for their University login, check that they are
actually registered for the class, and then automagically create a new private
repository for them in the form `hw-answers-<id>` and add them to the Students
team.

In addition to the creating of the repositories, I also made a script to check
to see what students aren't in the class that are currently registered and to
automatically remind them that they need to register as soon as possible.

### Source Code

After the class is finished, I'll make the code to this little bot available on
my [GitHub][jdavis].

### How We Are Using the Repos

We have a few different repositories that we are using. The first repo is the
only public one and it is the [course-info][course-info] repo. It contains the
syllabus information as well as some basic guides to help the students set
everything up.

The second repository is private but available for all the students to see. This
is where we will release homeworks and publish solutions as they become
available. This is also the repository that students are encouraged to discuss
within the repositories Issue Tracker. This is replacing the discussion boards
of the past.

The bulk of our repository usage (roughly 50) is each student's repository to
contain their answer sheets. These are essentially manual [Forks][forks] of the
main homework repository from the previous paragraph. The students are
responsible for [syncing][sync] their repositories with the official homework
repository to bring in new homeworks as they are released.

There are a few other repositories like one for the code that I've created for
the course and the grading infrastructure the other TA has created. We also have
an internal homework repository that we use to organize all the future homeworks
and to collaborate.

## Grading & Feedback

The best part about using GitHub for homework submissions is that it is
incredibly easy to give feedback and help the students through learning the
material.

In the past, most feedback/grading is provided back to the student in a little
.txt file that contains a few comments and the final grade.

With GitHub, we can comment on specific commits, specific lines of code, and see
how the student progressed through the homework.

It is far more valuable to the student for this kind of interaction. Without
using GitHub, it would be a lot more difficult because of the time it would
require to do this.

When it comes to grading, all of our homeworks come with a suite of unit tests
that test nearly every part of the homework. The students can get immediate
feedback on how well they are doing.

This also makes it incredibly easy to grade. The other TA has created a bot
written in Scala that grabs all of the homework repositories and runs the set of
unit tests. The results are then written to a text file and pushed back to the
repository.

We the TAs then can see the final status of their tests and then spend the rest
of the time looking at the code to see why any of the tests failed and how they
can improve their code.

This cuts out so much time that would be spent downloading zip files, extracting
them, manually running the tests and so on.

## Ways to Improve

So far only a week has passed since the semester started so there are a lot of
unforeseen things that might happen. I'm sure I will think of other ways to
improve this little system but there are a few major ones that I can see right
now:

1. Continuous integration would be nice. Like I mentioned, we have to instruct
   the bot to grab the homeworks and test them. It would be great to use
   something like [TravisCI][travis] to test every commit as it is pushed.

   The problem is that the homeworks need to be private but TravisCI is only
   free for open source projects. It would be great if TravisCI provided an
   Educational discount like GitHub.

2. A more formal submission process. Right now we are saying that the code just
   needs to be pushed by the homework deadline. There is nothing that needs to
   be done to actually "submit" their homework.

   There are a few issues with this because if a student forges a commit time
   stamp, they can set the date a to be before the deadline and still push the
   code.

   We are looking into ways to counter this in the short term. The first that
   comes to my mind is to just run a bot shortly after the deadline to grab the
   SHA-1 HEAD of the master branch and its parent commits for every student's
   repository. This would ensure that any tampering with the git log would be
   noticeable and change the SHA-1s.

## Going Forward

Once the semester is finished, I will revisit the topic to see how things turned
out. I really hope that things go well \^\_\^.

[bb]: http://www.blackboard.com/
[gh]: https://github.com/
[hl]: http://en.wikipedia.org/wiki/Half-Life_(video_game)
[coms342]: https://github.com/ComS342-ISU
[edu]: https://education.github.com/
[node]: http://nodejs.org/
[api]: http://developer.github.com/v3/
[travis]: https://travis-ci.org/
[jdavis]: https://github.com/jdavis
[course-info]: https://github.com/ComS342-ISU/course-info
[forks]: https://help.github.com/articles/fork-a-repo
[sync]: https://help.github.com/articles/syncing-a-fork
[lorand]: http://lorandszakacs.com/
