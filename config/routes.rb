Rails.application.routes.draw do
   scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      root 'static_pages#home', as: 'home'
      get 'static_pages/help', as: 'help'
 end
end
