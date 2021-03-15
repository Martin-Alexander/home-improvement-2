# Home Improvement

[![Build Status](https://www.travis-ci.com/Martin-Alexander/home-improvement-2.svg?branch=master)](https://www.travis-ci.com/Martin-Alexander/home-improvement-2)

## Testing

Automated tests for controllers, models, and policies were implemented with RSpec. [Travis CI](https://www.travis-ci.com/) was used for continuous integration.

## CSS & Responsiveness

I used [Tailwind](https://tailwindcss.com/) — a utility first CSS library. CSS components and variables are in `app/javascrips/stylesheets/application.css`.

The app is fully responsive.

## Admin Panel

Instead of implementing an in-app admin panel, I used [Forst Admin](https://www.forestadmin.com/).

## Authentication and Authorization

[Devise](https://github.com/heartcombo/devise) and [omniauth-facebook](https://github.com/simi/omniauth-facebook) where used for sign in. And [pundit](https://github.com/varvet/pundit) was used for authorization

## React

The comment system uses React. It fetches and sends data to Rails API endpoints.

## Real-time Components

The comment system polls the Rails API for new comments.

## Going further

Some things that I would work on next:

- A "My Projects" dashboard where uses can edit and delete their own projects
- Sign up confirmation emails to prevent spam accounts
- Some small CSS bugs