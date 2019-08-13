class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmarks = Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?||params[:landmark][:year_completed].empty?
    #binding.pry
    redirect  '/landmarks'
  end

  get '/landmarks/:id' do
    @landmarks = Landmark.find_by_id(params[:id])
    #binding.pry
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
     @landmarks = Landmark.find_by_id(params[:id])
     erb :'landmarks/edit'
   end

   patch '/landmarks/:id' do
    @landmarks = Landmark.find_by_id(params[:id])
    @landmarks.update(params[:Landmark]) unless params[:Landmark][:name].empty?||params[:Landmark][:year_completed].empty?
    redirect '/landmarks'
   end
end
