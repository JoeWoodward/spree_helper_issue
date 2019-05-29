### This app demonstrates a bug that spree introduces while using actiontext in rails 5.2.3

If I install action_text in rails 5.2.3 it loads the view helpers correctly, however, if I then install spree the view helper `render_action_text_content` is not loaded.

The first commit is a plain app with action text installed, the second commit shows the error.

To view the app running correctly

```sh
git checkout 947a54
bundle install
bundle exec rails db:setup
bundle exec rails server
open http://localhost:3000/foos/1
```

You should see the seeded data `foo bar baz` see `open ./app/views/foos/show.html.erb`

Now if you checkout the second commit with spree installed it fails

```sh
git checkout master
bundle install
bundle exec rails db:migrate
bundle exec rails server
open http://localhost:3000/foos/1
```

I have tried my best to debug but have so far failed. I am using a workaround by manually requiring the helpers in my application controller.

```ruby
# frozen_string_literal: true

require 'action_text'

class ApplicationController < ActionController::Base
  helpers ActionText::Engine.helpers

  ...
end
```
