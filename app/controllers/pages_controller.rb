require 'httparty'

class PagesController < ApplicationController
  def home
    response = HTTParty.get('https://v2.jokeapi.dev/joke/Programming?blacklistFlags=racist,sexist,explicit')
    @random = JSON.parse(response.body)
    @randomsetup = @random['setup']
    @randomdeliver = @random['delivery']
  end

  def about
  end
end
