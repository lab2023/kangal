# Kangal

[![Code Climate](https://codeclimate.com/github/kebab-project/kangal.png)](https://codeclimate.com/github/kebab-project/kangal)
[![Dependency Status](https://gemnasium.com/kebab-project/kangal.png)](https://gemnasium.com/kebab-project/kangal)
[![Build Status](https://travis-ci.org/kebab-project/kangal.png?branch=develop)](https://travis-ci.org/kebab-project/kangal)

NOTE: Don't use this gem until v1.0.0

**Kangal**

## Requirements

Before generating your application, you will need:

* Ruby ~> 2.0
* Rails ~> 4.0

## Usage

In your Gemfile

```ruby
gem 'kangal'
```

### Email Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :email

  # Email validator
  validates :email, presence: :true, email: :true
end


p = User.new
p.email = "info@lab2023.com"
p.valid? # => true

p.email = "info@lab"
p.valid? # => false

p.email = "Onur Ozgur <info@lab2023.com>"
p.valid? # => false
```

### Subdomain Validator
```ruby
require 'kangal'
class User
  include ActiveModel::Validations
  attr_accessor :subdomain

  # Subdomain validator
  validates  :subdomain, subdomain: true

  # Or
  validates  :subdomain, subdomain: { :reserved => %w(foo bar) }
end


p = User.new
p.subdomain = "www"
p.valid? # => false

p.subdomain = "https"
p.valid? # => false

p.subdomain = "-lab2023"
p.valid? # => false

p.subdomain = "-lab2023-"
p.valid? # => false

p.subdomain = "foo"
p.valid? # => false

p.email = "lab2023"
p.valid? # => true
```

**Default reserved names:** www, ftp, mail, pop, smtp, admin, ssl, sftp, http, https


## Bugs and  Feedback

If you discover any bugs or want to drop a line, feel free to create an issue on GitHub.

http://github.com/kebab-project/kangal

## Contributing

Kangal uses [TomDoc](http://tomdoc.org/), [rDoc](http://rubydoc.info/gems/kangal) and [SemVer](http://semver.org/), and takes it seriously.

Once you've made your great commits:

1. Fork Template
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create a Pull Request from your branch
5. That's it!

## Credits

- Kangal is maintained and funded by [lab2023 - internet technologies](http://lab2023.com/)
- Thank you to all the [contributors!](https://github.com/kebab-project/kangal/graphs/contributors)
- The names and logos for lab2023 are trademarks of lab2023, inc.

## License

Copyright 2012 lab2023 – internet technologies
