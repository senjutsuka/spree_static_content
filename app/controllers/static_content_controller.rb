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
    
    if path.match('\/*-asJS')
      path = path.chomp('-asJS') 
      unless @page = CmsPage.visible.find_by_slug(path)
        render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
      end 
      @target = params[:target]
      Rails.logger.debug @target
      Rails.logger.debug @page
      render :template => 'static_content/show.js.erb', :content_type => 'text/javascript'
    end
    
    unless @page = CmsPage.visible.find_by_slug(path)
      render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
    end 
  end
  
  private
  
  def accurate_title
    @page ? @page.title : nil
  end
end

