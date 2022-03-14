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
Warming up --------------------------------------
             hakusho    38.176k i/100ms
           uuidtools     6.974k i/100ms
           ruby-uuid     6.114k i/100ms
              uuid4r     2.372k i/100ms
Calculating -------------------------------------
             hakusho    382.105k (± 0.3%) i/s -      1.947M in   5.095452s
           uuidtools     69.501k (± 0.4%) i/s -    348.700k in   5.017225s
           ruby-uuid     61.299k (± 0.4%) i/s -    311.814k in   5.086883s
              uuid4r     23.730k (± 0.5%) i/s -    120.972k in   5.097876s

Comparison:
             hakusho:   382105.0 i/s
           uuidtools:    69501.5 i/s - 5.50x  (± 0.00) slower
           ruby-uuid:    61298.9 i/s - 6.23x  (± 0.00) slower
              uuid4r:    23730.4 i/s - 16.10x  (± 0.00) slower
```

### UUID Version 4

```
Warming up --------------------------------------
             hakusho   104.664k i/100ms
           uuidtools    16.197k i/100ms
           ruby-uuid    10.519k i/100ms
              uuid4r     4.608k i/100ms
        securerandom    92.162k i/100ms
Calculating -------------------------------------
             hakusho      1.052M (± 0.4%) i/s -      5.338M in   5.075885s
           uuidtools    161.776k (± 0.4%) i/s -    809.850k in   5.006079s
           ruby-uuid    105.226k (± 0.4%) i/s -    536.469k in   5.098320s
              uuid4r     46.054k (± 0.5%) i/s -    230.400k in   5.002927s
        securerandom    921.781k (± 0.4%) i/s -      4.700M in   5.099194s

Comparison:
             hakusho:  1051627.8 i/s
        securerandom:   921780.8 i/s - 1.14x  (± 0.00) slower
           uuidtools:   161775.6 i/s - 6.50x  (± 0.00) slower
           ruby-uuid:   105226.3 i/s - 9.99x  (± 0.00) slower
              uuid4r:    46054.1 i/s - 22.83x  (± 0.00) slower
```

### UUID Version 5

```
Warming up --------------------------------------
             hakusho    37.770k i/100ms
           uuidtools     6.932k i/100ms
           ruby-uuid     5.991k i/100ms
              uuid4r     2.357k i/100ms
Calculating -------------------------------------
             hakusho    377.407k (± 0.3%) i/s -      1.888M in   5.003939s
           uuidtools     69.226k (± 0.4%) i/s -    346.600k in   5.006841s
           ruby-uuid     60.044k (± 0.3%) i/s -    305.541k in   5.088621s
              uuid4r     23.582k (± 0.3%) i/s -    120.207k in   5.097412s

Comparison:
             hakusho:   377407.2 i/s
           uuidtools:    69226.2 i/s - 5.45x  (± 0.00) slower
           ruby-uuid:    60044.5 i/s - 6.29x  (± 0.00) slower
              uuid4r:    23582.2 i/s - 16.00x  (± 0.00) slower
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
