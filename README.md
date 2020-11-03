# README

Those initialization problems got fixed by the gem's author. You can see the details here: [janko/rodauth-rails#14](https://github.com/janko/rodauth-rails/issues/14)

Steps used to put this together

At my local machine:

```
cd ~/dev
mkdir rodauth-rails
cd rodauth-rails
docker run --rm -v "$(pwd):/api" -ti -w /api ruby:2.7-alpine sh
```

Inside the ruby container:

```
apk --no-cache add alpine-sdk postgresql-dev tzdata
gem install rails
rails new . --database=postgresql --api

echo "gem 'rodauth-rails', '~> 0.4'" >> Gemfile
echo "gem 'jwt', require: false" >> Gemfile
bundle
rails generate rodauth:install
```

Exit the container and switch to docker-compose

```
docker-compose build
docker-compose run --rm api --service-ports sh
```

Creating the databases

```
rake db:create

rake aborted!
ActiveRecord::NoDatabaseError: FATAL:  database "api_development" does not exist
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/postgresql_adapter.rb:50:in `rescue in postgresql_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/postgresql_adapter.rb:33:in `postgresql_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:887:in `new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:931:in `checkout_new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:910:in `try_to_checkout_new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:871:in `acquire_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:593:in `checkout'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:437:in `connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:1119:in `retrieve_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_handling.rb:221:in `retrieve_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_handling.rb:189:in `connection'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:130:in `activerecord_connection'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:122:in `activerecord_lock'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:34:in `synchronize'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection/postgres.rb:5:in `synchronize'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:278:in `test_connection'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/misc.rb:169:in `initialize'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:57:in `new'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:57:in `connect'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:124:in `connect'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:402:in `adapter_method'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:409:in `block (2 levels) in def_adapter_method'
/api/config/initializers/sequel.rb:4:in `<main>'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:59:in `load'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:59:in `load'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:318:in `block in load'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:291:in `load_dependency'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:318:in `load'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:666:in `block in load_config_initializer'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/notifications.rb:182:in `instrument'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:665:in `load_config_initializer'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:625:in `block (2 levels) in <class:Engine>'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:624:in `each'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:624:in `block in <class:Engine>'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:32:in `instance_exec'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:32:in `run'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:61:in `block in run_initializers'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:50:in `each'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:50:in `tsort_each_child'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:60:in `run_initializers'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:363:in `initialize!'
/api/config/environment.rb:5:in `<main>'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/loaded_features_index.rb:92:in `register'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:31:in `require'
/usr/local/bundle/gems/zeitwerk-2.4.1/lib/zeitwerk/kernel.rb:33:in `require'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:324:in `block in require'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:291:in `load_dependency'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:324:in `require'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:339:in `require_environment!'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:523:in `block in run_tasks_blocks'

Caused by:
PG::ConnectionBad: FATAL:  database "api_development" does not exist
/usr/local/bundle/gems/pg-1.2.3/lib/pg.rb:58:in `initialize'
/usr/local/bundle/gems/pg-1.2.3/lib/pg.rb:58:in `new'
/usr/local/bundle/gems/pg-1.2.3/lib/pg.rb:58:in `connect'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/postgresql_adapter.rb:46:in `postgresql_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:887:in `new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:931:in `checkout_new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:910:in `try_to_checkout_new_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:871:in `acquire_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:593:in `checkout'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:437:in `connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_adapters/abstract/connection_pool.rb:1119:in `retrieve_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_handling.rb:221:in `retrieve_connection'
/usr/local/bundle/gems/activerecord-6.0.3.4/lib/active_record/connection_handling.rb:189:in `connection'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:130:in `activerecord_connection'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:122:in `activerecord_lock'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection.rb:34:in `synchronize'
/usr/local/bundle/gems/sequel-activerecord_connection-1.0.1/lib/sequel/extensions/activerecord_connection/postgres.rb:5:in `synchronize'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:278:in `test_connection'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/misc.rb:169:in `initialize'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:57:in `new'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/database/connecting.rb:57:in `connect'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:124:in `connect'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:402:in `adapter_method'
/usr/local/bundle/gems/sequel-5.38.0/lib/sequel/core.rb:409:in `block (2 levels) in def_adapter_method'
/api/config/initializers/sequel.rb:4:in `<main>'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:59:in `load'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:59:in `load'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:318:in `block in load'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:291:in `load_dependency'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:318:in `load'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:666:in `block in load_config_initializer'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/notifications.rb:182:in `instrument'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:665:in `load_config_initializer'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:625:in `block (2 levels) in <class:Engine>'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:624:in `each'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/engine.rb:624:in `block in <class:Engine>'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:32:in `instance_exec'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:32:in `run'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:61:in `block in run_initializers'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:50:in `each'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:50:in `tsort_each_child'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/initializable.rb:60:in `run_initializers'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:363:in `initialize!'
/api/config/environment.rb:5:in `<main>'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/loaded_features_index.rb:92:in `register'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:31:in `require'
/usr/local/bundle/gems/zeitwerk-2.4.1/lib/zeitwerk/kernel.rb:33:in `require'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:324:in `block in require'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:291:in `load_dependency'
/usr/local/bundle/gems/activesupport-6.0.3.4/lib/active_support/dependencies.rb:324:in `require'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:339:in `require_environment!'
/usr/local/bundle/gems/railties-6.0.3.4/lib/rails/application.rb:523:in `block in run_tasks_blocks'
Tasks: TOP => db:create => db:load_config => environment
(See full trace by running task with --trace)
```

Commented all the lines in `./config/initializers/sequel.rb`

```
rake db:create
Created database 'api_development'
Created database 'api_test'
```

Uncommented all the lines inside `./config/initializers/sequel.rb`

```
rake db:create

Created database 'api_development'
Created database 'api_test'
/api # rake db:migrate
== 20201102104417 CreateRodauth: migrating ====================================
-- enable_extension("citext")
   -> 0.0218s
-- create_table(:accounts)
   -> 0.0144s
-- create_table(:account_password_hashes)
   -> 0.0089s
-- create_table(:account_password_reset_keys)
   -> 0.0115s
-- create_table(:account_verification_keys)
   -> 0.0109s
-- create_table(:account_login_change_keys)
   -> 0.0084s
== 20201102104417 CreateRodauth: migrated (0.0766s) ===========================
```

When I run `rails routes`, those are the routes I get:

```
rails routes

                               Prefix Verb   URI Pattern                                                                              Controller#Action
        rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
           rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
        rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
  rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
        rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
         rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
       rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
                                      POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
        rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
                                      PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
                                      DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
                   rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
            rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
                   rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
            update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
                 rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
```

A request to `localhost:3000` works tho.
