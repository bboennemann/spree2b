Deface::Override.new(
    :virtual_path => "spree/admin/shared/_configuration_menu",
    :name => "distributor_carts_menu",
    :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
    :text => "<%= configurations_sidebar_menu_item t(:distributor_cart), admin_distributor_carts_path %>")