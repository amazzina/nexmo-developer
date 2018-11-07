# Nexmo Developer

[![Build Status](https://api.travis-ci.org/Nexmo/nexmo-developer.svg?branch=master)](https://travis-ci.org/Nexmo/nexmo-developer/)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.txt)

This repository is the code and content for <https://developer.nexmo.com>, which includes the Nexmo documentation, API reference, SDKs, Tools & Community content. To get a Nexmo account, sign up [for free at nexmo.com][signup].
 
### [Testing](#testing) &middot; [Running Locally](#running-locally) &middot; [Admin Dashboard](#admin-dashboard) &middot; [Troubleshooting](#troubleshooting) &middot; [Contributing](#contributing) &middot; [License](#license)

 

     
## Testing

We use [rspec](http://rspec.info/) to test Nexmo Developer.

To run all tests:

```bash
bundle exec rspec
```

To generate code coverage, set the `COVERAGE` environment variable when running the tests.

```bash
COVERAGE=1 bundle exec rspec
```

This will create a folder named `coverage`. Open `index.html` in this folder to view coverage statistics.

## Running locally

The project can be run on your laptop, either directly or using Docker. These instructions have been tested for mac.

### Setup for running directly on your laptop

Before you start, you need to make sure that you have:

- [Ruby 2.5.1](https://www.ruby-lang.org/en/downloads/) + [bundler](https://bundler.io/)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Yarn](https://yarnpkg.com/en/docs/install)

To set up the project, clone this project and configure your settings:

```
$ git clone git@github.com:Nexmo/nexmo-developer.git
$ cd nexmo-developer
$ cp .env.example .env
```

Edit the `.env` file as appropriate for your platform.  Then, run the following:

```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ ./bin/yarn install
$ rails s
```

You should now be able to see the site on http://localhost:3000/

### Setting up with Docker

If you don't want to install Ruby & PostgreSQL then you can use docker to sandbox Nexmo Developer into its own containers. After you [Install Docker](https://docs.docker.com/engine/installation/) run the following:

```
$ git clone git@github.com:Nexmo/nexmo-developer.git
$ cd nexmo-developer
$ cp .env.example .env
```

Edit the `.env` file as appropriate for your platform.  Then, start the web server with this command:

```
$ docker-compose up
```

At this point, open your browser to http://localhost:3000/ ... and wait (it takes about 30 seconds for the first load).

To stop the server cleanly run:

```
$ docker-compose down
```

## Admin dashboard

You can access the admin dashboard by visiting `/admin`. If you've populated data via `rake db:seed` you will have an admin user with the username of `admin@nexmo.com` and password of `development`.

The following is an example if you are running Nexmo Developer within a Docker container:

```sh
docker exec -it <container_id> rake db:seed
```

New admin users can be created by visiting `/admin/users` or by accessing the rails console and creating a new User like so:

```ruby
User.create!(email: 'example@example.com', password: 'password', admin: true)
```
## Troubleshooting

#### I'm having issues with my Docker container

The image may have changed, try rebuilding it with the following command:

```
$ docker-compose up --build
```

#### I get an exception `PG::ConnectionBad - could not connect to server: Connection refused` when I try to run the app.

This error indicates that PostgreSQL is not running. If you installed PostgreSQL using `brew` you can get information about how to start it by running:

```
$ brew info postgresql
```

Once PostgreSQL is running you'll need to create and migrate the database. See [Setup](#running-locally) for instructions.

## Contributing 
We :heart: contributions from everyone! It is a good idea to [talk to us](https://nexmo-community-invite.herokuapp.com/) first if you plan to add any new functionality. Otherwise, [bug reports](https://github.com/Nexmo/nexmo-developer/issues/), [bug fixes](https://github.com/Nexmo/nexmo-developer/pulls) and feedback on the library is always appreciated. Look at the [Contributor Guidelines](CONTRIBUTING.md) for more information and please follow the [GitHub Flow](https://guides.github.com/introduction/flow/index.html).

## [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues) [![GitHub contributors](https://img.shields.io/github/contributors/Nexmo/nexmo-developer.svg)](https://GitHub.com/Nexmo/nexmo-developer/graphs/contributors/)

## License

This library is released under the [MIT License][license]

[signup]: https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=nexmo-developer
[license]: LICENSE.txt
