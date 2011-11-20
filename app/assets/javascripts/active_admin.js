//= require active_admin/base

$(document).ready(function() {
    $('#product_product_type').change(loadProductEdit);
});

function loadProductEdit() {
    var type = $('#product_product_type option:selected').text().toLowerCase();
    $('#main_content').load('new_product?product_type=' + type);
}
