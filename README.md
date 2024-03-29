
# REQUIREMENTS

Using local VM for testing ($uname -a): Linux ginchet1-VirtualBox 4.2.0-27-generic #32~14.04.1-Ubuntu SMP Fri Jan 22 15:32:26 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

Using Aalto Server for further testing: Linux precious 3.2.0-4-amd64 #1 SMP Debian 3.2.73-2+deb7u3 x86_64 GNU/Linux


Erlang 18+ (check with $erl) (currrent version in the local VM is Erlang/OTP 19 [erts-8.2] ) https://raw.githubusercontent.com/capbash/bits/master/erlang.bits

Elixir 1.2+ ($elixir --version) (current version is Elixir 1.3.4) https://raw.githubusercontent.com/capbash/bits/master/elixir.bits

NodeJS 5.3+ ($node --version) (current version is v6.9.1) https://raw.githubusercontent.com/capbash/bits/master/nodejs.bits

Phoenix 1.1+ ($mix phoenix.new -v) (current version is Phoenix v1.2.1) https://raw.githubusercontent.com/capbash/bits/master/phoenix.bits

Nginx 1.8+ ($nginx -v) (current version is nginx version: nginx/1.11.8) https://raw.githubusercontent.com/capbash/bits/master/nginx.bits

Python 2.7.11+ ($python --version) (current version is Python 2.7.12) https://raw.githubusercontent.com/capbash/bits/master/python.bits

Let's encrypt / certbot

# INSTALLS

## INSTALLATION OF NGINX AND PYTHON
###NGINX and Let's encrypt
You can add this repo if you are not able to upgrade to version 1.8+
```
sudo apt-get remove nginx
apt-get purge nginx nginx-common
sudo nano /etc/apt/sources.list
```
Add these lines for UBUNTU:
```
deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx
```
Or these for DEBIAN:
```
deb http://nginx.org/packages/debian/ wheezy nginx
deb-src http://nginx.org/packages/debian/ wheezy nginx
```
Get signing key and install
```
wget http://nginx.org/packages/keys/nginx_signing.key
cat nginx_signing.key | sudo apt-key add - 
apt-get update
apt-get install nginx
```
For Let's encrypt / certbot
```
cd /usr/local/sbin
sudo wget https://dl.eff.org/certbot-auto
sudo chmod a+x /usr/local/sbin/certbot-auto
```
And then
```
letsencrypt-auto certonly -a manual --rsa-key-size 4096 --email todor.a.ginchev@aalto.fi -d precious3.research.netlab.hut.fi
```
###PYTHON
You can add this repo if you not able to upgrade to Python 2.7.11+
```
sudo apt-add-repository ppa:fkrull/deadsnakes-python2.7
sudo apt-get update
sudo apt-get install python2.7 python2.7-dev
```
More info: https://raw.githubusercontent.com/capbash/bits/master/python.bits
    
##INSTALLATION OF ELIXIR, ERLANG, POSTRESQL and NODE.JS http://www.phoenixframework.org/docs/installation
###Install Elixir, Erlang, Phoenix, Node.js and PostgreSQL
For Node.js, make sure that version is >=5.0.0
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
nvm install stable
node -v
```
For PostgreSQL
```
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
```

I left without installation: inotify-tools 

# ELIXIR TUTORIAL NOTES
##UP AND RUNNING http://www.phoenixframework.org/docs/up-and-running
If the connection to the db fails with "invalid password for user postgres" try first:  
```
su postres
psql
ALTER USER postgres PASSWORD 'postgres';
```
you can also try:
```
cd /etc/postsgresql/9.x/pg_hba.conf
emacs -nw pg_hba.conf
```
and change 127.0.0.1/32 to localhost

If npm is not installed
```
sudo apt-get install npm
```
Add Github as known host, needed for the ssh
```
ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
sudo npm install
```

##Adding pages http://www.phoenixframework.org/docs/adding-pages

##Routing http://www.phoenixframework.org/docs/routing
Resources, in web/router.ex:
```
scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
        resources "/users", UserController # <--- adding this line
     end
```
to see the routes (run in root dir):    
```
mix phoenix.routes
```
If we want usee only part of the "resources" functions:
```
        resources "/posts", PostController, only: [:index, :show] #this leaves only index and show functions
        resources "/comments", CommentController, except: [:delete] #this disables the delete function
```    
Path helpers section is a bit unclear
    
Nested Resources
```
resources "/users", UserController do
    resources "/posts", PostController
end
```    
Important: 'as: :admin' in
```
scope "/admin", as: :admin do
    resources "/reviews", HelloPhoenix.Admin.ReviewController
end
```
Important: scope "/admin", HelloPhoenix.Admin, as: :admin do
     
# TESTING 
## TESTING HTTPS+JSON ON ELIXIR
As explained in http://www.phoenixframework.org/docs/routing, I have added 'resources "/api/users", UserController' in file './web/router.ex'

Then I added the ./web/controllers/UsersController

Then I added the ./web/views/users_view

Then I added the ./web/templates/users_templates
    

For testing I use curl:

Example of JSON post request:
```
curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost:4000/api/login
```
where (-H is short for --header, -d for --data.)

Example of post request:
```
curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost/api/users/
```
Check this out: https://robots.thoughtbot.com/testing-a-phoenix-elixir-json-api
   
## TESTING POSTGRESQL
First enter into posgtres account (default pwd is postgres)
```
su postgres
```
Follow tutorial http://www.phoenixframework.org/docs/ecto-models

Create table:
```
mix phoenix.gen.html PostsqlController postsqluser name:string email:string gender:boolean birthyear:integer nickname:string
```
Add route:
```
resources "/postsqluser", PostsqlController
```
Create and migrate:
```
mix ecto.create
mix ecto.migrate
```

The command listed (\d users) should be called inside your PostgreSQL interactive terminal (psql) prompt:
```
psql -U postgres -W -h localhost hello_phoenix_dev
```

### Ecto data types
https://hexdocs.pm/ecto/Ecto.Schema.html


    
#   NGINX+ELIXIR INTEGRATION TESTING   
Following tutorial: https://medium.com/@a4word/setting-up-phoenix-elixir-with-nginx-and-letsencrypt-ada9398a9b2c#.1fbtcyp20

Note: By default, the configuration file is named nginx.conf and placed in the directory '/usr/local/nginx/conf', '/etc/nginx', or '/usr/local/etc/nginx'
```
nano /etc/nginx/nginx.conf
```
Restart ngingx:
```
sudo nginx -s reload 
```

# Documentation
###Links from Vicent about Elixir
https://github.com/h4cc/awesome-elixir#Reading
https://github.com/oreillymedia/etudes-for-elixir
###Links about Elixir integration in nginx
https://medium.com/@a4word/setting-up-phoenix-elixir-with-nginx-and-letsencrypt-ada9398a9b2c#.1fbtcyp20
###Accepted ECTO types
https://hexdocs.pm/ecto/Ecto.Schema.html

