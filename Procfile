web: bundle exec puma -C config/puma.rb -p $PORT
worker: bundle exec sidekiq -c 2 -v -q default -q mailers
