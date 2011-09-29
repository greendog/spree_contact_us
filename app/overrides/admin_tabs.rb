  Deface::Override.new(:virtual_path => "layouts/admin",
                       :name => 'contact_us',
                       :insert_after => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                       :text => "<%=  tab(:inquiries)  %>",
                       :disabled => false)
