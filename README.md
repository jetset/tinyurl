# Readme 

## Install

The app has been built and tested on ruby '2.7.2' and rails 6.1. 

to install if you are using rvm. 

```
  rvm install 2.7.2
  git clone https://github.com/jetset/tinyurl
  cd tinyurl
  bundle 
  rails db:create
  rails db:migrate 
  # To generate tokens please run the following 
  rails generate:keys

```
### Run tests 

```
rspec 
```

### Run the ruby IDE 

```
 ruby bin/tinyurl-ide.rb
 
```

![Screen Shot 2021-08-30 at 12 35 27 PM](https://user-images.githubusercontent.com/599252/131426163-c8c21bb7-ba7a-41f5-b077-572201768233.png)
