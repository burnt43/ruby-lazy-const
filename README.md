# ruby-lazy-const

### Description
Automagically lazily load constants without having to explicitly require the files they are located in.

### Tutorial
Require the gem:

```ruby
require 'ruby-lazy-const'
```

Set the base directory where all your ruby files are:

```ruby
LazyConst::Config.base_dir = '/home/foobar/ruby_project/lib'
```

This gem will now automatically find the file where the const is located in as long as you follow convention for filenames and ruby const names.

Suppose you have some files:

#### lib/foo.rb
```ruby
class Foo
end
```

#### lib/bar.rb
```ruby
module Bar
end
```

#### lib/bar/qux.rb
```ruby
module Bar
  class Qux
  end
end
```

As long as you set ```LazyConst::Config.base_dir``` correctly, then when you have a constant that is not yet loaded into Ruby, it will find it.
```ruby
Foo # This const is not defined, so we will load it from lib/foo.rb
Bar # This const is not defined, so we will load it from lib/bar.rb
Bar::Qux # This const is not defined, so we will load it from lib/bar/qux.rb
```
