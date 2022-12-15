# README

- Turn of auto complete in rails console `$ echo 'IRB.conf[:USE_AUTOCOMPLETE]=false' >> ~/.irbrc`

flyctl ssh console "restless-lake-6063"

- https://community.fly.io/t/how-to-get-into-the-rails-console-or-other-tasks-in-a-buildpack-based-deploy/3642/15

The above Link worked for accessing rails console on fly.io

So I was able to get this working by:

fly ssh console
bash
cd /app
cat profile.d/ruby.sh # executing is denied
Exporting the variables found there manually sets up what we need. Then we can do bin/rails c and the console loads.
