---
layout: page
title: Lectures
permalink: /lectures/
---

Clicking the title of the lecture will open the slides in your browser. The icons navigate to relevant material for each lecture: 

<i class="fab fa-github"></i> = Github directory for all source code; <i class="fab fa-r-project"></i> = source Rmarkdown document for lecture; <i class="fas fa-book"></i> = additional readings.

The lectures are produced using [xaringan slides](https://slides.yihui.org/xaringan/#1). Presentation notes are available by pressing "p". Slides can be printed to pdf by first scrolling through all slides (to ensure all content renders) and printing to pdf from your browser. [Allegedly](https://bookdown.org/yihui/rmarkdown/ioslides-presentation.html#printing-and-pdf-output) Google Chrome has the best support for this.

{% assign num = site.url | size | minus: 1 %}

<ul id="archive">
{% for lectures in site.data.lectures %}
      <li class="archiveposturl">
        <span><a href="{{ site.url | slice: 0, num }}{{ site.baseurl }}/lectures/{{ lectures.dirname }}/{{ lectures.filename }}.html" target="_blank">{{ lectures.title }}</a></span><br>
<span class = "postlower">
<strong>tl;dr:</strong> {{ lectures.tldr }}</span>
<strong style="font-size:100%; font-family: 'DM Sans', sans-serif; float:right; padding-right: .5em">
	<a href="https://github.com/{{ site.githubdir}}/tree/master/lectures/{{ lectures.dirname }}"><i class="fab fa-github"></i></a>&nbsp;&nbsp;
<a href="https://github.com/{{ site.githubdir}}/tree/master/lectures/{{ lectures.dirname }}/{{ lectures.filename}}.Rmd"><i class="fab fa-r-project"></i></a>&nbsp;&nbsp;
<a href="{{ site.url | slice: 0, num }}{{ site.baseurl }}/readings#{{ lectures.reading }}"><i class="fas fa-book"></i></a>&nbsp;&nbsp;
</strong> 
      </li>
{% endfor %}
</ul>
