


## SPLICE: A distributed, automated, customizable metaprogramming framework and developer-embetterment robot.

This is a framework designed for building full-fledged web applications together with versioned, scalable, modular components that can be automatically grafted onto applications.  The code can be found at the [*Splice Framework Github Repo*](http://github.com/levbrie/splices). Created by [Lev Brie](http://github.com/levbrie).

Initial Setup
--------------------------------------------------------------------------------

* Ruby version: ruby 2.0.0p353 (2013-11-22 revision 43784)
* Rails version: 4.0.2
* System dependencies: Ruby 2.0.0, ~> Rails 4.0, Redis, PostgreSQL, Github
* Configuration: `$ bundle`
* Database creation: `$ bundle exec rake db:create`
* Database initialization: `$ bundle exec rake db:migrate db:test:prepare`
* Test suite: `$ rspec`
* Services (job queues) - Sidekiq workers using Redis: `$ redis-server /usr/local/etc/redis.conf`
* Deployment instructions: `$ rails s -p 3012`

Project Description
-------------------

Splice is a metaprogramming framework for web applications.  Its primary purpose is to enable developers to create reusable architectural components.  Automated infrastructure technologies like Chef and Puppet have created an ecosystem of for developing repeatable deployment processes from recipes.  This project takes its inspiration from that one, but aims at a very different kind of automation.

Traditionally, developing a given feature for an applications is tightly coupled to the application itself.  Even with a service-oriented architecture, individual features cannot easily be extracted from the application and used elsewhere.  Developers build the same features over and over again for each new project.

Significant Idea
----------------

Code Architecture
-----------------

Please see the attached class and architecture diagrams.



