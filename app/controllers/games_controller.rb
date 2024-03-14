require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
  @answer = params[:answer]
  url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
  jsonResult = URI.open(url).read
  parsedResult = JSON.parse(jsonResult)
  @result = parsedResult['found']

  if @result == true
    @result = "Success"
  else
    @result = "Fail"
  end
  end



  def score
    @letters = []
    10.times do |char|
      @letters << ('a'..'z').to_a.sample
    end


  end
end
