## Wax Starter

General info about the site build.

## Front-End Dev Requirements

### Ruby

There is a `.ruby-version` file, so if you're using rbenv
or RVM you shouldn't have to worry about this.

Check ruby version (looking for 2.1.1)

    $ ruby -v 
    
If not 2.1.1 

    $ ruby install 2.1.1

### Bundler

If you don't have it, run

    $ gem install bundler

## Front-End Wax Installation

Clone the repo, then run

    $ bundle install
    $ npm install

Build the static files and start the wax server by running:

    $ bundle exec foreman start

If you want to specify the port number you go run this instead:

    $ bundle exec foreman start -p 5200

Your Wax server should now be available if you browse to http://localhost:5000
