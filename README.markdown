# Shared Workforce Demo

This is an example Rails app that shows how to tag a photo using Shared Workforce.

The app has a user model which includes a photo. When a user is created and a photo is uploaded, the photo is sent to Shared Workforce where it is tagged by a human worker.

The task class is in `app/tasks/tag_photo_task.rb`, and there is an associated unit test in `test/tasks/tag_photo_task_test.rb`

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
  $ heroku create --app cedar
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

You will also need to enter the details of an Amazon S3 bucket to use for the test.

```
SHAREDWORKFORCE_API_KEY=my-api-key
S3_KEY=my-s3-key
S3_SECRET=my-s3-secret
S3_BUCKET=my-s3-bucket
```

Once you have entered your details, start the app using Foreman.

```term
  $ foreman start
```

## Creating a user

Visit `http://localhost:5000` and follow the link to create a user. Enter a username and choose a photo. Once the photo is uploaded, it will be sent to Shared Workforce for moderation. If you leave your local app running, it will wait for a response for the task and moderate the photo. (Note that if you stop the server before the task is completed, you won't see the response in your local app). Typically it will take anything from a couple of minutes to an hour for your task to be completed.