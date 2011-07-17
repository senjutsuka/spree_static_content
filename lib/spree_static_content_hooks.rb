class SpreeStaticContentHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%=  tab(:cms_pages)  %>)
  end
end
