# Blocitoff [![Code Climate](https://codeclimate.com/github/silvio-galli/blocitoff/badges/gpa.svg)](https://codeclimate.com/github/silvio-galli/blocitoff)

A self-destructing to-do list application made with the help of my mentor [Charlie Gaines](https://github.com/beaugaines) at [Bloc](http://www.bloc.io).

[Demo available here](https://gentle-taiga-73865.herokuapp.com/) on Heroku platform.

The source code is on [GitHub](https://github.com) at: [https://github.com/silvio-galli/blocitoff](https://github.com/silvio-galli/blocitoff)


## Tech specs
The project is based on **Ruby on Rails**, uses **Bootstrap** for the layout and other elements on the page.

**Database seeding** is obtained using the [Faker](https://github.com/stympy/faker) gem.

**Seeding is allowed only after the first user has logged-in.**
If you want to seed the database in `development` environment, follow these instructions:
- Run `rails s` in terminal.
- Visit [localhost:3000](localhost:3000) page with your favourite browser and sign-in with your Google account.
- Return to your terminal window and run `rake db:seed`. The tasks table in the databse will be populated with 30 different tasks for the first user in the database.

The project makes also use of a little **javascript** and **jQuery** to add unobtrusive completion and deletion with ajax.

**Environment variables and keys** are managed with the help of [Figaro](https://github.com/laserlemon/figaro) gem.

**Authentication** is managed through the [Devise](https://github.com/plataformatec/devise) gem and [OmniAuth-Google-oauth2](https://github.com/zquestz/omniauth-google-oauth2).


## Features

- User can sign-in through their Google account.
- User can add tasks with title, description and an expected end date.
- Task will be marked as completed when the user completed it, incompleted if the user do not complete it on time (both showed in the sidebar).
- User can delete tasks from list.
- There is a soft deletion feature: clicking on "Delete" will mark task as "deleted" and show it on a "deleted list" in the sidebar.
- To completely delete a task from Blocitoff, the user have to click on "Erase": task will be permanently deleted from the database.


---

###### mentioned gems
![](https://img.shields.io/badge/rails-4.2.5-green.svg?style=flat)
![](https://img.shields.io/badge/bootstrap_sass-3.3.5.1-green.svg?style=flat)
![](https://img.shields.io/badge/faker-1.6.3-green.svg?style=flat)
![](https://img.shields.io/badge/jquery_rails-4.0.5-green.svg?style=flat)
![](https://img.shields.io/badge/figaro-1.1.1-green.svg?style=flat)
![](https://img.shields.io/badge/devise-3.5.6-green.svg?style=flat)
![](https://img.shields.io/badge/omniauth_google_oauth2-0.4.0-green.svg?style=flat)
