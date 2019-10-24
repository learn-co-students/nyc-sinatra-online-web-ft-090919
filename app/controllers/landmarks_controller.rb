class LandmarksController < ApplicationController

  get '/' do
    redirect "/landmarks"
  end

  get '/landmarks' do # landmarks index
    @landmarks = Landmark.all
    @figures = Figure.all

    erb :"landmarks/index"
  end

  get '/landmarks/new' do # landmarks create
    erb :"landmarks/new"
  end

  post '/landmarks' do
    Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])

    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["landmark"]["name"],
      year_completed: params["landmark"]["year_completed"])

    redirect "/landmarks/#{@landmark.id}"
  end

end