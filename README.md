# Questions App Backend

This repository contains the backend for the Questions App, developed using Ruby on Rails. It provides APIs for managing questions and user interactions.

## Features

- **Question Management**: Create, read, update, and delete questions.
- **User Authentication**: Secure user registration and login.
- **API Endpoints**: RESTful endpoints for seamless integration with the frontend.

## Prerequisites

Before setting up the project, ensure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (version specified in `.ruby-version`)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
- [PostgreSQL](https://www.postgresql.org/download/)

## Installation

1. Clone the Repository
   ```bash
   git clone https://github.com/MarawanHassaan/Questions-App-Backend.git
   cd Questions-App-Backend
   ```
2. Install Dependencies
  ```bash
  bundle install
  ```
3. Configure the Database
   Set up your PostgreSQL database credentials in config/database.yml.
   Create and migrate the database:
  ```bash
  rails db:create
  rails db:migrate
  ```
4. Start the Server:
  ```bash
  rails server
  ```
The application will be accessible at http://localhost:3000.
