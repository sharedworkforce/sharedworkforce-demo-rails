if %w{SHAREDWORKFORCE_API_KEY S3_KEY S3_SECRET S3_BUCKET}.any? {|e| ENV[e].blank? }
	raise "Please set up your .env file with your Shared Workforce API key and S3 credentials. See the readme on http://github.com/sharedworkforce/sharedworkforce-demo-rails"
end