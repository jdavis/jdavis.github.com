---
layout: post
title: GitHub &#43; University&#58; A Follow Up
description:
    Revisiting my previous post on using GitHub for College.
css:
    - /css/code.css
---

# {{ page.title }}

###### Follow Up

> This is a follow up post to my original post:
> [GitHub + University: How College Coding Assignments Should
> Work][coding-assignments]

At the beginning of the year, I wrote [a post][coding-assignments] that detailed
how myself and another TA were going to experiment with using GitHub for all of
the course assignments.

I promised a follow-up with some source code plus how it went. I've had many,
many people email me saying they were looking forward to the follow up, so here
it is.

If you want to jump straight to the few scripts that I wrote, check out the
source here:

<div class="buttons">
    <a class="button" href="https://github.com/jdavis/github-plus-university"><i class="icon-github"></i> View on GitHub</a>
</div>

## Learning Curve

For a lot of the students, this was the first time that they had any experience
with any sort of version control system.

We all know what that feels like and have our own stories about either the pain
or triumph in learning it.

To counter this, I wrote up a [Git/GitHub guide][git-guide] that explained
how to set things up as well as how we intended to use the repositories.

### Homework Zero

To cut down on issues that might occur close to the deadline of homeworks that
matter, we had a required yet ungraded Homework 0. We used this to get all of
the Git issues out of the way and to ensure that all the students had it
properly setup.

The homework just contained some simple questions regarding the syllabus.

### Student Issues

There were 50 people in the class and I'd estimate (based on the people I talked
to) that a fifth or so had issues with Git/GitHub.

I thought this number was completely reasonable for a class of this size. While
most of the issues that I came across could have been solved by a quick
Google search, I think the students just wanted a personal touch in solving the
issue.

The great thing is that while the questions were plentiful during Homework 0, by
the time of the first real homework a small percentage of students still had
issues.

## A Course Setup App

As I mentioned in the previous post, I created a little app to help in creating
all the repositories for the students. The app is written in NodeJS and has a
few different dependencies: [package.json][package]

The problem was that we knew the student's University ID but we didn't know
their GitHub info.

This app does a few things, each thing with a link to specific lines of code in
the source where this happens:

1. It uses OAuth to request a token for the student's GitHub account. This
   ensures that the account is valid. [(link to source)][bot-token].

   It also adds this token to a SQLite database just in case you need to use it
   again. [(link to source)][bot-store]
2. It asks the student for a University ID and validates it against a list of
   students in the course. [(link to source)][bot-validate]
3. It then creates a repository in the Organization according to a predetermined
   format. [(link to source)][bot-repo]
4. It adds the student to the organization and gives them permission to view the
   newly created repository. The repository is also only visible to the student
   (and instructors/TAs). [(link to source)][bot-membership]

View the [README][README] for more details on using the code.

### Helper Scripts

I also have three helper scripts for the app.

1. [createTable.js][createTable] creates a new SQLite database with two columns:
   a place for the username and one for the GitHub OAuth token.
2. [dumpTable.js][dumpTable] just outputs the entire table; it's pretty simple.
3. [unenrolled.js][unenrolled] goes through the entire list of students given in
   the CSV file and then queries GitHub to see if the student has already been
   added to the organization. If not, it prints the list and formats so you can
   easily see which students have been slacking and haven't signed up yet.

## Administering the Course

In addition to GitHub, we also used the University standard for courses,
Blackboard. We used it for posting lecture notes as well as announcements as it
was still tied into the University side emailing system.

Using GitHub, it let us to the following really easily: troubleshooting
student's code, releasing new homeworks, and grading homework.

Before I look at each of these, first let me refresh how we had the repositories
setup.

### Repo Setup

1. (Public) [Course-Info][course-info] was the repo that was publicly available and it
   contained the syllabus as well as other useful information.
2. (Public) [Recitations][recitations] was the repo that I put test code and other things
   that we worked on in my recitation section.
3. (Private) Main Homework Repo: this was a private repository that was the repository
   that we we put newly released homework in as well as solutions to previous
   homeworks.
4. (Private) Student Repos: there was a student repo for every student in the class. Each
   was private to that student which means that only the instructor, the TAs and
   that student could see the contents. This is where the student would keep
   their homework submissions and answer sheets.

#### Manual Fork

GitHub has the idea of a Fork within its interface. The idea is that you can
[Fork][forks] a repo and then contribute to the upstream with your changes. It
might seem a bit magical but this mechanism is easy to understand.

The term fork doesn't exist in Git; it only exists in GitHub. This is important
because we couldn't use Forks within GitHub because if each student Forked the
Main Homework Repo, it would have the same permissions and every other student
would be able to see the repository.

A fork actually is just a convenient way to manage branches and remotes within
Git with a bit of cleverness on top.

To mimic a Fork but keep the repo private, it was pretty straight forward. We
told the students to use their repository as the `origin` and the Main Homework
Repo as the `upstream`.

Here is what a correct repo would look like:

{% highlight bash %}
$ git remote -v
  upstream git@github.com:ComS342-ISU/homework.git (fetch)
  upstream git@github.com:ComS342-ISU/homework.git (push)
  origin git@github.com:ComS342-ISU/hw-answers-joshuad.git (fetch)
  origin git@github.com:ComS342-ISU/hw-answers-joshuad.git (push)
{% endhighlight %}

As you can see that the "Main Homework Repo" is set to be the upstream and my
own repository is set to be the origin.

This allowed the student to "pull" in new changes just by checking the
`upstream` remote and the `master` branch. The section on new homeworks will
provide the exact command in case remotes and branches are unfamiliar to you.

To see more about how to do this, check out the guide that we provided:
[Git/GitHub Guide][git-guide].


### Troubleshooting Code

One of the best things about using GitHub to host code was that it made it
trivial to troubleshoot a student's code. There were a handful of occasions when
a student was having a strange error that I couldn't debug over email.

I'd email the student back, telling them to commit what they have so far and I
would be able to debug it then. I'd then either  pull the repository locally
and run it, or I would just debug by looking at it in GitHub.

### New Homeworks & Solutions

Releasing new homeworks was dead simple. One of the TA's or the instructor would
just add a new folder containing the homework files to the main repo.

Then we'd release an announcement on Blackboard with the reminder to run the
following:

{% highlight bash %}
$ git pull upstream master
{% endhighlight %}

This tells Git to look at the `master` branch of the Main Homework Repo (which
we've configured to be called `upstream`), then to pull in all the changes.

This also allowed us to add solutions as we wished and by keeping things in
separate folders, it allowed us to eliminate merge conflicts.

### Submitting Homeworks

In the [original post][coding-assignments], I mentioned that there are various
ways to improve the setup. The first was the issue of submitting homeworks.

The solution that we ended up using was the simple solution proposed by Lorand.
He said that instead of worrying about any of the repo history, he could just
run the grading bot 15 minutes after the homework deadline.

This gave enough time for people that had strange issues to get things resolved,
yet close enough to the deadline that it effectively solved the "submission"
process.

### Grading Homework

The other TA, [Lorand][lorand], wrote up a wicked cool bot in Scala that would
download all of the repositories, run a suite of unit tests on them, then upload
the text output with a rough grade.

Then depending on which one of us was going to grade the homework, we'd manually
review the results and inspect each student's code. Then we'd assign the final
grade based on the unit test results as well as the code inspection.

Since Lorand was the one that wrote the grading bot, you'd have to ask him for
the source code if you'd like to see it.

## Student's Response

In the class there were a handful of advanced engineers that already knew Git.
The great thing is that I heard from a few in that they really enjoyed the
setup.

Here's one student's response in particular that I liked:

<div class="gallery medium">
    <a href="/img/cs342/git.png" rel="lightbox[git]" title="One student's response.">
        <img src="/img/cs342/git.png" >
    </a>
</div>


## Conclusion

If I had to be a TA again, I would pick to use GitHub in a heartbeat. It saved
us a ton of time in not only releasing homeworks but grading them.

Hopefully if you are coming here to learn more about how to use GitHub for your
course this will help.

Let me know if there's anything that's vague or missing from this post.
Thanks again for reading!

## After Thought

I am really interested in creating an actual software solution to this. I think
it has the potential to be a great help in classrooms and bring some much needed
innovation to the coding + teaching front.

If you are interested in helping or just want to sign up for the beta (if it
ever is completed), please do [contact me][contact]. I'd love to hear about your
suggestions and your story.

[README]: https://github.com/jdavis/github-plus-university/blob/master/README.md
[bot-membership]: https://github.com/jdavis/github-plus-university/blob/master/app/server.js#L280-L348
[bot-repo]: https://github.com/jdavis/github-plus-university/blob/master/app/server.js#L350-L369
[bot-store]: https://github.com/jdavis/github-plus-university/blob/master/app/server.js#L230-L233
[bot-token]: https://github.com/jdavis/github-plus-university/blob/master/app/server.js#L159-L215
[bot-validate]: https://github.com/jdavis/github-plus-university/blob/master/app/server.js#L240-L278
[coding-assignments]: /2014/01/19/github-university-how-college-assignments-should-work/
[contact]: /about/#contact
[course-info]: https://github.com/ComS342-ISU/course-info
[createTable]: https://github.com/jdavis/github-plus-university/blob/master/app/scripts/createTable.js
[dumpTable]: https://github.com/jdavis/github-plus-university/blob/master/app/scripts/dumpTable.js
[git-guide]: https://github.com/ComS342-ISU/course-info/blob/master/guides/course-setup.md
[lorand]: http://lorandszakacs.com/
[package]: https://github.com/jdavis/github-plus-university/blob/master/app/package.json
[recitations]: https://github.com/ComS342-ISU/recitations
[unenrolled]: https://github.com/jdavis/github-plus-university/blob/master/app/scripts/unenrolled.js
[forks]: https://help.github.com/articles/fork-a-repo
