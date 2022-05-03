Rails.application.routes.draw do
  root 'static_pages#top'
  get 'fried_rices/preparation', to: 'fried_rices#preparation'
  post 'fried_rices/result', to: 'fried_rices#result'
  # GETでリクエストされた場合はトップページを表示させたいため
  get 'fried_rices/result', to: 'static_pages#top'
end
