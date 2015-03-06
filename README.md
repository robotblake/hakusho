# Hakusho

A fast uuid generation and parsing library.  Currently supports UUID versions 3, 4, and 5.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "hakusho"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hakusho

## Usage

### Parsing

```ruby
uuid = Hakusho.parse("6ba7b811-9dad-11d1-80b4-00c04fd430c8")
```

### Generation

#### Version 3 (MD5)

```ruby
ns   = Hakusho.parse("6ba7b811-9dad-11d1-80b4-00c04fd430c8")
uuid = Hakusho.create_md5(ns, "this is a pretty rad stirng")
```

### Version 4 (Random)

```ruby
uuid = Hakusho.create_random
```

### Version 5 (SHA1)

```ruby
ns   = Hakusho.parse("6ba7b811-9dad-11d1-80b4-00c04fd430c8")
uuid = Hakusho.create_sha1(ns, "this is a pretty rad stirng")
```

## Benchmarks

These were created by running `bin/benchmark`.

### UUID Version 3

```
Calculating -------------------------------------
             hakusho     7.672k i/100ms
           uuidtools     1.056k i/100ms
           ruby-uuid     1.709k i/100ms
              uuid4r     2.045k i/100ms
-------------------------------------------------
             hakusho     86.471k (± 3.3%) i/s -    437.304k
           uuidtools     10.852k (± 3.5%) i/s -     54.912k
           ruby-uuid     17.866k (± 3.4%) i/s -     90.577k
              uuid4r     21.429k (± 3.1%) i/s -    108.385k

Comparison:
             hakusho:    86471.2 i/s
              uuid4r:    21429.2 i/s - 4.04x slower
           ruby-uuid:    17865.8 i/s - 4.84x slower
           uuidtools:    10852.4 i/s - 7.97x slower
```

### UUID Version 4

```
Calculating -------------------------------------
           fast_uuid    12.581k i/100ms
           uuidtools     2.584k i/100ms
           ruby-uuid     2.829k i/100ms
              uuid4r     3.396k i/100ms
        securerandom    10.522k i/100ms
-------------------------------------------------
           fast_uuid    156.784k (± 3.3%) i/s -    792.603k
           uuidtools     27.215k (± 3.1%) i/s -    136.952k
           ruby-uuid     29.793k (± 3.9%) i/s -    149.937k
              uuid4r     36.125k (± 3.1%) i/s -    183.384k
        securerandom    129.485k (± 3.2%) i/s -    652.364k

Comparison:
           fast_uuid:   156783.6 i/s
        securerandom:   129485.5 i/s - 1.21x slower
              uuid4r:    36125.3 i/s - 4.34x slower
           ruby-uuid:    29792.8 i/s - 5.26x slower
           uuidtools:    27214.7 i/s - 5.76x slower
```

### UUID Version 5

```
Calculating -------------------------------------
             hakusho     7.406k i/100ms
           uuidtools     1.032k i/100ms
           ruby-uuid     1.662k i/100ms
              uuid4r     2.029k i/100ms
-------------------------------------------------
             hakusho     82.308k (± 2.9%) i/s -    414.736k
           uuidtools     10.669k (± 3.0%) i/s -     53.664k
           ruby-uuid     17.515k (± 3.1%) i/s -     88.086k
              uuid4r     21.395k (± 2.6%) i/s -    107.537k

Comparison:
             hakusho:    82308.0 i/s
              uuid4r:    21394.9 i/s - 3.85x slower
           ruby-uuid:    17514.8 i/s - 4.70x slower
           uuidtools:    10669.1 i/s - 7.71x slower
```

## TODO

* Tests (non-existant)
* Better documentation
* Version 1 & 2 UUIDs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Credits

* [Matthew Callis](https://github.com/matthewcallis) -- For his inspiring name and design input
* [Ruby on Ales](https://twitter.com/rbonales) -- For the liquid courage to get this done

## Contributing

1. Fork it ( https://github.com/robotblake/hakusho/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
