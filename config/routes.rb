Rails.application.routes.draw do
  get 'fried_rice/preparation'
  get 'fried_rice/result'
  root 'static_pages#top'
end
