$(document).ready(function() {

	$('.card-header').click(function() {
		$(this).find('i').toggleClass('fa fa-plus fa fa-minus');
	});

	//$('#manageProfileAccordian .collapse').collapse('show');
	//$('.collapse.in').collapse('hide');
	$('.panel-collapse').removeData('bs.collapse').collapse({
		parent : false,
		toggle : false
	}).collapse('show').removeData('bs.collapse').collapse({
		parent : '#manageProfileAccordian',
		toggle : false
	});
	
	$('#addNewAddress').click(function() {
		// handle redirect here
		$(this).find('i').toggleClass('fa fa-plus fa fa-minus');
		$('#manageProfileAccordian div.newAddressForm').toggle('slow');
	});
	
	//confirm delete address//
	
/*	$('#confirmDeleteAddressYesNo').on(
			'show',
			function() {
				var link = $(this).data('link');
			});*/

	$('#addressListTable i.fa-trash').on('click', function(e) {
		e.preventDefault();
		var link = $(this).parent().data('link');
		$('#confirmDeleteAddressYesNo').data('link', link).modal('show');
	});

	$('#btnYesDeleteAddress').click(function() {
		// handle redirect here
		var link = $('#confirmDeleteAddressYesNo').data('link');
		location.href = link;
		$('#confirmDeleteAddressYesNo').modal('hide');
	});
	
	//end of confirm delete
	
	//update existing address
	
	$('#addressListTable i.fa-edit').on('click', function(e) {
		e.preventDefault();
		var $span=$(this).parent();
		var addr_id = $span.data('id');
		var addr_line_1 = $span.data('addrl1');
		var addr_line_2 = $span.data('addrl2');
		var city = $span.data('city');
		var state = $span.data('state');
		var pin = $span.data('pin');
		$('#hiddenAddressId').val(addr_id);
		$('#inputAddress1').val(addr_line_1);
		$('#inputAddress2').val(addr_line_2);
		$('#inputCity').val(city);
		$('#inputState').val(state);
		$('#inputPin').val(pin);
		$('.updateExistingAddressForm').show();
	});
	$('#cancelUpdateAddress').on('click', function(e) {
		$('.updateExistingAddressForm').hide();
	});
	

});
