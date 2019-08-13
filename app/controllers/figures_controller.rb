class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figures = Figure.find_by_id(params[:id])
    #binding.pry
    erb :'figures/show'
  end


  post '/figures' do
    #binding.pry
     @figure = Figure.create(params['figure'])
     unless params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end
     unless params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end
     @figure.save
     redirect to "/figures/#{@figure.id}"
   end

   get '/figures/:id/edit' do
     @figures = Figure.find_by_id(params[:id])
     erb :'figures/edit'
   end

   patch '/figures/:id' do
     #binding.pry
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
