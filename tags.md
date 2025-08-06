---
layout: default
title: "All Tags"
permalink: /tags/
---

<h1>All Tags</h1>
<ul>
  {% for tag in site.tags %}
    <li><a href="/tag/{{ tag[0] | slugify }}/">{{ tag[0] }} ({{ tag[1].size }})</a></li>
  {% endfor %}
</ul>
