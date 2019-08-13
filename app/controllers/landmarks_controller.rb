class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmarks = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'landmarks/show'
  end

  post '/landmarks' do
    binding.pry
    @landmarks = Landmark.create(params[:Landmark]) unless params[:landmark][:name].empty?&&params[:landmark][:year_completed].empty?
        redirect to '/landmarks/#{@landmarks.id}'
    end
  end
end
