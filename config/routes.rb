Panopticon::Engine.routes.draw do
  mount Panopticon::Engine, at: "/panopticon"
  root to: "panopticon#index"
end
