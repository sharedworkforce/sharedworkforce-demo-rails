# Shared Workforce Demo

This is an example Rails app that shows how to tag a photo using Shared Workforce.

The app has a user model which includes a photo. When a cat is created, the image is sent to Shared Workforce where it is tagged, rotated and cropped by a human worker.

You can view a live sandbox demo of the app at http://catsify.herokuapp.com

The task classes are in `app/tasks`, and there are associated example unit tests in `test/tasks`

## Installation

Clone the app to your local workstation:

```term
  $ git clone git://github.com/sharedworkforce/sharedworkforce-demo-rails.git
  Cloning into sharedworkforce-demo-rails...
```

Run bundle install to install required gems:

```term
  $ cd sharedworkforce-demo-rails
  $ bundle install
  Your bundle is complete!
```

Setup the database:

```term
  $ rake db:setup
  -- create_table("users", {:force=>true})
    -> 0.0042s
  -- initialize_schema_migrations_table()
    -> 0.0040s
  -- assume_migrated_upto_version(20120327110249)
    -> 0.0056s
```

## Running the demo app

If you are using Heroku, you can use the Shared Workforce addon:

Create an app:

```term
  $ heroku create --stack cedar
  Creating ratchet-screwdriver-trees-4005... done, stack is cedar
```

Add the Shared Workforce addon:

```term
  $ heroku addons:add sharedworkforce
  -----> Adding sharedworkforce to ratchet-screwdriver-trees-4005... done, v18 (free)
```

Get your API key from the app's config:

```term
  $ heroku config | grep SHAREDWORKFORCE_API_KEY
  SHAREDWORKFORCE_API_KEY => acdc30b2-14c5-46ee-ba35-11d50edc65ec
```

Note: If you are not using Heroku and you would like to try Shared Workforce, visit http://www.sharedworkforce.com or email erica@sharedworkforce.com.

Once you have your API key, rename the file .env_template to .env, and add your Shared Workforce API key.

```term
  $ cp .env_template .env
  $ $EDITOR .env
```

Insert your key:

```
SHAREDWORKFORCE_API_KEY=my-api-key
```

Once you have entered your API key, start the app.

```term
  $ rails s
```

Open the app at http://localhost:3000

There is a rake task to collect the task responses during development.

```
  $ rake sw:collect
```

Note: the rake task isn't needed in production, the webhook will take care of it.

## Creating a cat

Visit `http://localhost:3000` and follow the link to create a cat with an image url. Once the cat is saved, it will be sent to Shared Workforce for moderation. Typically it will take anything from a couple of minutes to an hour for your task to be completed.

## Deploying to Heroku

To deploy the app on Heroku, simply deploy in the normal way.

```term
  $ git push heroku master
  $ heroku run rake db:migrate
  $ heroku restart
  $ heroku open
```