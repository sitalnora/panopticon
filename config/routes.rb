Panopticon::Engine.routes.draw do
  mount Panopticon::Engine, at: "/panopticon"
  get 'analysis', to: 'memory_watcher#analysis'
  root to: "memory_watcher#index"
end
