class StaticContentController < Spree::BaseController
  caches_action :show
  
  def show
    path = case params[:path]
    when Array
      '/' + params[:path].join("/")
    when String
      params[:path]
    when nil
      request.path
    end
    
    #if this is a js request we need to remove it from the slug
    path = path.chomp('.js')  

    unless @page = CmsPage.visible.find_by_slug(path)
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
    end
    @target = params[:target]
    respond_to do |format|
      format.html #show.html.erb
      format.js
    end
  end
  
  private
  
  def accurate_title
    @page ? @page.title : nil
  end
end

