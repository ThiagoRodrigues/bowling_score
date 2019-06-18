
## Setup and Run Instructions

### Setup
   1. Clone the repository to a desired directory e.g('~/code')
```
git clone git@github.com:ThiagoRodrigues/bowling_score.git
   ```
   2.  cd  into 'code challenge' directory
```
cd ~/code/bowling_score
  ```
   3.  run bundle install to install the missing gems.
```ruby
bundle install
   ```
### Running the tests
```
run bundle exec rspec
```
### Try the console:
run `irb` from the bowling_score root path, then:

```ruby
Game.autoplay or Game.new.play
```
### Note
This code is not able to receive external input. It works simulating the knocked pins using `rand`.
