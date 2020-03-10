class TodosController < ApplicationController
  def index
    render plain: "Hello to rails! #{DateTime.now.to_s(:long)}"
  end
end
