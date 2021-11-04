# Household Spending - v2 (Rails)

This was created during my time as a student at Code Chrysalis.

The aim of this app is to provide an online tool to help monitor household spending.
What are we spending money on each month, and where are we spending it.

## Pre-requisites
You have rbenv, ruby and rails installed

## Installation

Install this project with bundler

```bash
  bundle install
  rails db:setup
```

## Run locally
```bash
  rails s
```

## Documentation

Additional gems used

* [devise](https://rubygems.org/gems/devise)
* [chartkick](https://rubygems.org/gems/chartkick)
* [bootstrap](https://rubygems.org/gems/bootstrap)
* [groupdate](https://rubygems.org/gems/groupdate)
* [pagy](https://rubygems.org/gems/pagy)

## Deployment

This app is currently deployed on [heroku](https://rails-household-spending.herokuapp.com/)

## Lessons Learned

* Rails has a very strict way of doing things and this makes it easy to achieve basic CRUD, but can make later flexibility harder, compared to my experiences in javascript.
* There are a lot of resources, but not always a lot of explaination on how to use them in particular ways, for example, passing a parameter to my controller from the view. I tried a lot of things before stumbling upon a coherant and simple explanation.
* There is nearly always a gem for that. Seriously check out [Rubygems.org](https://rubygems.org/)