# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'cgi'

FILE_PATH = 'public/memos.json'
next_id = 1

def collect_memos
  File.open(FILE_PATH) { |f| JSON.parse(f.read) }
end

def find_memo(id)
  memos = collect_memos
  memos[id]
end

def save_memos(memos)
  File.open(FILE_PATH, 'w') { |f| JSON.dump(memos, f) }
end

def delete_memo(id)
  memos = collect_memos
  memos.delete(id)
  save_memos(memos)
end

get '/' do
  redirect '/memos'
end

get '/memos' do
  @app_name = 'メモアプリ'
  @memos = collect_memos
  erb :index
end

get '/memos/new' do
  erb :new
end

get '/memos/:id/edit' do
  @memo = find_memo(params[:id])
  erb :edit
end

get '/memos/:id' do
  @memo = find_memo(params[:id])
  erb :show
end

post '/memos' do
  memos = collect_memos
  memos[next_id] = { 'title' => params[:title], 'content' => params[:content] }
  save_memos(memos)
  next_id += 1

  redirect '/memos'
end

patch '/memos/:id' do
  memos = collect_memos
  memos[params[:id]] = { 'title' => params[:title], 'content' => params[:content] }
  save_memos(memos)

  redirect "/memos/#{params[:id]}"
end

delete '/memos/:id' do
  delete_memo(params[:id])

  redirect '/memos'
end
