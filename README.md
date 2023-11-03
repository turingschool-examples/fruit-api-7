# Fruits API

This repository is meant to be a practice assessment for Mod 3 BE. 

Skills: 
* API Consumption

## Setup
Requires Ruby 3.2.2 and Rails 7.0.x

1. Fork/clone this repository. Set up the repo as normal
2. Run the usual setup steps (`bundle install`, `rails db:create`)


## Challenge

3. Review the [FruityVice API](https://www.fruityvice.com/doc/index.html) - this is a free service with no API Key requirement. 
   1. Make some test calls in Postman and/or your browser to get a feel for how it works. 
4. When ready, complete the user story below. 

**NOTE**: This application comes with a pre-built form at the `"welcome#index"` action and view. *Do not change the path for this form*, rather make the pre-existing form work alongside the user story below. 


### User Story 1 - Basic Search

```
As a user,
When I visit the root path ("/"),
I see a form with a search box for fruit and a button. 
When I enter the name of a fruit and click "Search"
I am taken to the "/foods" page
And I see information about that fruit, including
 - name
 - family
 - order
 - genus
 - nutrition value, organized as: 
   "Calories: x
   Fat: x
   Sugar: x
   Carbohydrates: x
   Protein: x
   "

```

### User Story 2 - Nutritional Value

```
As a user, 
When I am on a search result page "/fruits"
after making a successful search, 
I see a link that says "Find Similar Fruits by Nutrition Value" 
When I click this link
I am taken to a "/fruits/nutritional" page
Where I see the names of fruits that have a similar nutritional value

# Hint: use the min/max API endpoints
```

### User Story 3 - Clickable Names

```
As a user, 
When I use the Nutritional Value search 
and I see the names of fruits that have similar nutritional value, 
I can click on the names of each fruit
and I am taken to the "/fruits" page
where I see that specific fruit's information similar to the original search: 
 - name
 - family
 - order
 - genus
 - nutrition value, organized as: 
   "Calories: x
   Fat: x
   Sugar: x
   Carbohydrates: x
   Protein: x
   "
```