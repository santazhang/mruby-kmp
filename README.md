# KMP searching algorithm in mruby

## Using with mruby

Make a local copy of the mruby git tree, add the gem in your `build_config.rb`:

```ruby
conf.gem :github => 'santazhang/mruby-kmp', :branch => 'master'
```

And then just build mruby with `rake`.

## Usage

```ruby
kmp = KMP.new 'needle'
p kmp.match_first('finding a needle in a haystack')
# => 10

kmp = KMP.new [1, 2, 3]
p kmp.match_all([0, 1, 2, 3, 1, 2, 3])
# => [1, 4]

kmp = KMP.new 'rr'
p kmp.match_all('rrrr')
# => [0, 1, 2]
p kmp.match_all('rrrr', overlap=false)
# => [0, 2]
```
