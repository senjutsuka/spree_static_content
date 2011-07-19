Spree::BaseController.class_eval do
  # ProductsHelper needed for seo_url method used when generating
  # taxonomies partial in content/show.html.erb.
  helper :products
  # Use before_filter instead of prepend_before_filter to ensure that
  # ApplicationController filters that the view may require are run.
  before_filter :render_cms_page_if_exists

  # Checks if page is not beeing overriden by static one that starts with /
  #
  # Using request.path allows us to override dynamic cms_pages including
  # the home page, product and taxon cms_pages.
  def render_cms_page_if_exists
    # If we don't know if page exists we assume it's and we query DB.
    # But we realy don't want to query DB on each page we're sure doesn't exist!
    return if Rails.cache.fetch('page_not_exist/'+request.path)

    if request.path.match('\/*-asJS')
      path = request.path.chomp('-asJS') 
      unless @page = CmsPage.visible.find_by_slug(path)
        render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
      end 
      @target = params[:target]
      render :action => 'static_content/show.js.erb'
    end
    
    if @page = CmsPage.visible.find_by_slug(request.path)
      if @page.layout && !@page.layout.empty?
        render :template => 'static_content/show', :layout => @page.layout
      else
        render :template => 'static_content/show'
      end
    else
      Rails.cache.write('page_not_exist/'+request.path, true)
      return(nil)
    end
  end
end
