# Shared Workforce Demo

This is an example Rails app that shows how to tag a photo using Shared Workforce.

The app has a user model which includes a photo. When a user is created and a photo is uploaded, the photo is sent to Shared Workforce where it is tagged by a human worker.

The task class is in `app/tasks/tag_photo_task.rb`, and there is an associated unit test in `test/tasks/tag_photo_task_test.rb`

## Installation

Clone the app to your local workstation:

```term
  $ git://github.com/sharedworkforce/sharedworkforce-demo-rails.git`
  Cloning into sharedworkforce-demo-rails...
```

Run bundle install to install required gems:

```term
  $ cd sharedworkforce-demo-rails
  $ bundle install
  Your bundle is complete!
```

## Running the demo app

To try this demo app, you will need your own API key from Shared Workforce. To get one, visit http://www.sharedworkforce.com or email erica@sharedworkforce.com.

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

Once you have entered your details, run the app using Foreman:

```term
  $ rake db:setup
  $ foreman start
```

## Creating a user

Visit `http://localhost:5000` and follow the link to create a user with a photo. Once the photo is uploaded, it will be sent to Shared Workforce for moderation. If you leave your local app running, it will wait for a response for the task and moderate the photo. (Note that if you stop the server before the task is completed, you won't see the response in your local app.) Typically it will take anything from a couple of minutes to an hour for your task to be completed.