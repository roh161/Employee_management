# README

This README document outlines the steps required to set up and run the Rails application.

## Ruby version

This project uses Ruby version 2.7.0.

## System dependencies

Ensure you have Rails version 6.1.7 or a compatible version installed. Check the Gemfile for the exact version.

## Configuration

1. Add the required gems to your Gemfile:

    ```ruby
    gem 'rails', '>= 6.1.7', '< 6.2'
    gem 'activeadmin', '2.12.0'
    gem 'devise'
    gem 'arctic_admin'
    gem 'active_admin_role'
    ```

2. Run the following commands to install and configure each gem:

    - Install Active Admin:

        ```bash
        bundle install
        rails generate active_admin:install
        ```

    - Create Active Admin resources for specific models:

        ```bash
        rails generate active_admin:resource ModelName
        ```

    - Install Arctic Admin:

        ```bash
        bundle install
        echo "//= require arctic_admin/base" >> app/assets/javascripts/active_admin.js
        echo "@import 'active_admin/mixins';" >> app/assets/stylesheets/active_admin.scss
        echo "@import 'arctic_admin/base';" >> app/assets/stylesheets/active_admin.scss
        ```

    - Install Active Admin Role:

        ```bash
        bundle install
        rails generate active_admin_role:install
        rails db:migrate
        ```

## Database creation

Ensure the database is created and migrated:

```bash
rails db:create
rails db:migrate
