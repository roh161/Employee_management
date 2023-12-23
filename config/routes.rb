Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :leaves do
      member do
        put :approve
      end
    end
  end

  namespace :admin do
    resources :salaries do
      put :send_salary_email, on: :member
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
