#!/usr/bin/ruby
# hello2.cgi

require 'cgi'

# Create a cgi object, with HTML 4 generation methods.
cgi = CGI.new('html4')

# Ask the cgi object to send some text out to the browser.
cgi.out {
 cgi.html {
   cgi.body {
     cgi.h1 { 'Hello Ruby!' }
   }
 }
}
