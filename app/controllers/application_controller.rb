require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# READ
  get '/' do
    redirect '/posts'
  end

# READ
  get '/posts' do
    @posts = Post.all
    erb :index
  end

# CREATE
  get '/posts/new' do
    erb :new
  end

# READ?
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

# CREATE
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

# UPDATE
  #renders update form
  #note: need the forward slash before posts
  get '/posts/:id/edit' do
    #finds post to be updated
    @post = Post.find(params[:id])
    erb :edit
  end

# UPDATE
  #finds instance to be updated and saves that instance
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    #.update is ActiveRecord method
    Post.update(@post.id, name: params[:name], content: params[:content])
    redirect "/posts/#{params[:id]}"
  end


# DESTROY
  delete '/posts/:id/delete' do
    @deleted_post = Post.find(params[:id]).name
    Post.find(params[:id]).destroy
    erb :deleted
  end


end
