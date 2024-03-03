# StackOverflow Clone

Hello! This is my pet project designed to showcase and refine my web development skills. It is a replica of the StackOverflow website, built using Ruby on Rails, PostgreSQL, and Hotwire.

## About the Project

Users can ask questions, provide answers, vote on responses, and much more.

## Technologies

- **Ruby on Rails**: Used for developing the server-side of the application.
- **PostgreSQL**: A relational database for storing information about questions, answers, users, etc.
- **Hotwire**: A framework for creating interactive web applications without page reloading.

## Installation

```bash
git clone https://github.com/nplyusnin/stackoverclone.git
cd stackoverclone
cp config/database.yml.sample config/database.yml
cp docker-compose.yml.sample docker-compose.yml
bundle install
bundle exec rails db:setup
bundle exec rails db:seed
```

## Running

```bash
bundle exec rails s
```

## Running Tests

```bash
bundle exec rspec spec
```
