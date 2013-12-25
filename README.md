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


Significant Idea
----------------

Traditionally, developing a given feature for an applications is tightly coupled to the application itself.  Even with a service-oriented architecture, individual features cannot easily be extracted from the application and used elsewhere.  Developers build the same features over and over again for each new project.

Instead of building features directly into an application, Splice enables developers to program in the changes to the application that they'd like to make, control those changes through version control, commit them to a separate repository as a feature, register them with a splice server, and then add them to any application they'd like using Splice's grafting service.

Code Architecture
-----------------

Because of connectivity issues in my current location, the source code I'm sending to you is a local version where the Splice application server and the user code repositories and servers are all on a single machine, but the application is designed for a distributed environment. In the distributed environment, users can choose to hook into the version control service of their choice, such as Github, and Splice will use that to both pull in the application repo and push out version of the app with newly grafted components automatically, enabling developers to pull in changes from the master and redeploy applications any way they please complete with all of the spliced components that they've added.

You can see attached class and architecture diagrams for more on the setup.



