class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
  
  def index
    # get 5 products
    #shop = ShopifyAPI::Shop.current
     #@products = ShopifyAPI::Product.find(:all)
     @products = ShopifyAPI::Product.find(:all, :params => {:limit => 5, :order => "created_at DESC" })

    # get latest 5 orders
   # @orders   = ShopifyAPI::Order.find(:all, :params => {:limit => 5, :order => "created_at DESC" })
  end
  
  def show_basic
  @products = ShopifyAPI::Product.find(:all, :params => {:product_type => 'Basic Models'})#, :vendor => 'nokia'})
  
  
  #@products = ShopifyAPI::Product.find(:all, :conditions => { :product_type => "Android" } )
  #@products = @products.where( :product_type => "Android" ) 
  #@products = ShopifyAPI::Product.where( :product_type => "Android" ) 
  #@customers = ShopifyAPI::Customer.find(:all)
  #@articles= ShopifyAPI::Article.find(:all)
  end
  def show_android
  @products = ShopifyAPI::Product.find(:all, :params => {:product_type => 'Android'})
  end
  
  def show_camera
  @products = ShopifyAPI::Product.find(:all, :params => {:product_type => 'Camera'})
  end
  
end
