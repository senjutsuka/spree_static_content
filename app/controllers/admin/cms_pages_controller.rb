class Admin::CmsPagesController < Admin::BaseController
  resource_controller
  
  update.response do |wants|
    wants.html { redirect_to collection_url }
  end
  
  update.after do
    expire_page :controller => '/static_content', :action => 'show', :path => @cms_page.slug
    #Rails.cache.delete('page_not_exist/'+@cms_page.slug)
    Rails.cache.delete('cms_partials')
  end
  
  create.response do |wants|
    wants.html { redirect_to collection_url }
  end

  create.after do
    #Rails.cache.delete('page_not_exist/'+@cms_page.slug)
    Rails.cache.delete('cms_partials')
  end

end
