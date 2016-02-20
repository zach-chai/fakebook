class FakebooksController < ApplicationController

  def index
    @fakebooks = Bookcode.all
  end
end
