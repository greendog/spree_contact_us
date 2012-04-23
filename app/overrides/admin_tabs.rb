Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "spree_contact_us_inquiries_tab",
                     :original => "b14b1b16ac8937f99956ffef65de6f9c579ed1aa",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:inquiries, :url => spree.admin_inquiries_path) %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "inquiries_admin_configurations_menu",
                     :original => "35aede11c44b8ceff0be2d90bafd334d9d9b2ae2",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(t('inquiries'), admin_inquiry_settings_path, t('inquiry_settings')) %>",
                     :disabled => false)