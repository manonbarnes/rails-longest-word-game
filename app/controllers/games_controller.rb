class GamesController < ApplicationController
  require 'json'
  require 'open-uri'

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word].split("")
    @letters = params[:letters]
    @words_all = params[:word].downcase
    @info = open("https://wagon-dictionary.herokuapp.com/#{@words_all}")
    json = JSON.parse(@info.read)
    @found = json['found']
    if @word.all? { |letter| @letters.include?(letter) } && @found == true
      @result = "Congratulation #{@words_all} is a valid english word!"
    elsif @word.all? { |letter| @letters.include?(letter) } && @found == false
      @result = "Sorry but #{params[:word]} is not an english word"
    else
      @result = "Sorry but #{params[:word]} cannot be made from #{params[:letters]}"
    end

  end

  end


