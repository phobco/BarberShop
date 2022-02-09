# Barbershop

###### Sinatra `1.4.0`

Barbershop is a simple application written in [Sinatra](https://github.com/sinatra/sinatra) framework.

It allows you to make an appointment at a barbershop, view a list of those who have signed up and information about them.

### Usage

1. Clone repo
```
git clone git@github.com:phobco/barber-shop.git
```
2. Run commands
```bash
bundle install
rake db:migrate # required sqlite3
```
3. Start server
```
bundle exec ruby app.rb
```
4. Open in browser
```
localhost:4567
```
