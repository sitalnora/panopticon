Panopticon::Engine.routes.draw do
  mount Panopticon::Engine, at: "/panopticon"
  root to: "memory_watcher#index"
end
