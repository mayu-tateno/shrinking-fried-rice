Rails.application.routes.draw do
  get 'fried_rices/preparation'
  post 'fried_rices/result'
  root 'static_pages#top'
end
