# Capistrano::Idobata

Capistrano 3 integration with [idobata](http://idobata.io)

![](https://f.cloud.github.com/assets/43500/2460021/a57d4620-af64-11e3-83fe-f7c09d92f66d.png)


## Installation

```
# Gemfile
gem 'capistrano-idobata'
```

```
# Capfile
require 'capistrano/idobata'
```

```
# deploy.rb
set :idobata_hook_url, 'https://idobata.io/hook/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
```

## Support

- Ruby 2.0 or higher
- Capistrano 3 or higher

## Contributing

1. Fork it ( http://github.com/<my-github-username>/capistrano-idobata/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
