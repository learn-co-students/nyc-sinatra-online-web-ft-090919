class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end


  post '/figures' do
    if !params[:title][:name].empty?
      @figure = Figure.create(params[:figure])
      @figure.titles << Title.create(params[:title])
    else
      @figure = Figure.create(params[:figure])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do

    if !params[:title][:name].empty?
      @figure = Figure.find_by_id(params[:id])
      @figure.titles << Title.create(params[:title])
    else
      @figure = Figure.find_by_id(params[:id])
    end

    @figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    redirect "/figures/#{@figure.id}"
  end


end
