class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @recodes = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', '%'+content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content+'%')
      elsif method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == "post_image"
      if method == 'perfect'
        PostImage.where(shop_name: content)
      elsif method == 'forward'
        PostImage.where('shop_name LIKE ?', '%'+content+'%')
      elsif method == 'backward'
        PostImage.where('shop_name LIKE ?', '%'+content+'%')
      elsif method == 'partial'
        PostImage.where('shop_name LIKE ?', '%'+content+'%')
      else
        PostImage.where('shop_name LIKE ?', '%'+content+'%')
      end
    end
  end
end