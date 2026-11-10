---
icon: fas fa-utensils
order: 0
---

{% assign recipes = site.recipes | sort_natural: 'title' %}
{% assign tag_names = recipes | map: 'tags' | join: '|' | split: '|' | uniq | sort_natural %}

<div class="recipe-index">
  <h2 id="all-recipes" class="h4">All Recipes</h2>
  <ul>
    {% for recipe in recipes %}
      <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
    {% endfor %}
  </ul>

  {% for tag in tag_names %}
    <h2 id="{{ tag | slugify }}" class="h4 text-capitalize">{{ tag }}</h2>
    <ul>
      {% for recipe in recipes %}
        {% if recipe.tags contains tag %}
          <li><a href="{{ recipe.url | relative_url }}">{{ recipe.title }}</a></li>
        {% endif %}
      {% endfor %}
    </ul>
  {% endfor %}
</div>
