require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:available_letters].split
    @word = params[:word].upcase
    @included = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
    response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @english = json['found']
  end
end
