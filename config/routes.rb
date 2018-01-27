require "que/web"

Rails.application.routes.draw do
  root to: 'visitors#index'
  mount Que::Web => "/que"
end
