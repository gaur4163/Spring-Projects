
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/Payment.css" />">


<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>

<!-- If you're using Stripe for payments -->
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script>
	var $form = $('#payment-form');
	$form.on('submit', payWithStripe);

	/* If you're using Stripe for payments */
	function payWithStripe(e) {
		e.preventDefault();

		/* Visual feedback */
		$form.find('[type=submit]').html(
				'Validating <i class="fa fa-spinner fa-pulse"></i>');

		var PublishableKey = 'pk_test_6pRNASCoBOKtIshFeQd4XMUh'; // Replace with your API publishable key
		Stripe.setPublishableKey(PublishableKey);
		Stripe.card
				.createToken(
						$form,
						function stripeResponseHandler(status, response) {
							console.log
							if (response.error) {
								/* Visual feedback */
								$form.find('[type=submit]').html('Try again');
								/* Show Stripe errors on the form */
								$form.find('.payment-errors').text(
										response.error.message);
								$form.find('.payment-errors').closest('.row')
										.show();
							} else {
								/* Visual feedback */
								$form
										.find('[type=submit]')
										.html(
												'Processing <i class="fa fa-spinner fa-pulse"></i>');
								/* Hide Stripe errors on the form */
								$form.find('.payment-errors').closest('.row')
										.hide();
								$form.find('.payment-errors').text("");
								// response contains id and card, which contains additional card details
								var token = response.id;
								console.log(token);
								// AJAX
								$
										.post('/account/stripe_card_token', {
											token : token
										})
										// Assign handlers immediately after making the request,
										.done(
												function(data, textStatus,
														jqXHR) {
													$form
															.find(
																	'[type=submit]')
															.html(
																	'Payment successful <i class="fa fa-check"></i>')
															.prop('disabled',
																	true);
												})
										.fail(
												function(jqXHR, textStatus,
														errorThrown) {
													$form
															.find(
																	'[type=submit]')
															.html(
																	'There was a problem')
															.removeClass(
																	'success')
															.addClass('error');
													/* Show Stripe errors on the form */
													$form
															.find(
																	'.payment-errors')
															.text(
																	'Try refreshing the page and trying again.');
													$form.find(
															'.payment-errors')
															.closest('.row')
															.show();
												});
							}
						});
	}

	/* Form validation */
	jQuery.validator.addMethod("month", function(value, element) {
		return this.optional(element)
				|| /^(01|02|03|04|05|06|07|08|09|10|11|12)$/.test(value);
	}, "Please specify a valid 2-digit month.");

	jQuery.validator.addMethod("year", function(value, element) {
		return this.optional(element) || /^[0-9]{2}$/.test(value);
	}, "Please specify a valid 2-digit year.");

	validator = $form.validate({
		rules : {
			cardNumber : {
				required : true,
				creditcard : true,
				digits : true
			},
			expMonth : {
				required : true,
				month : true
			},
			expYear : {
				required : true,
				year : true
			},
			cvCode : {
				required : true,
				digits : true
			}
		},
		highlight : function(element) {
			$(element).closest('.form-control').removeClass('success')
					.addClass('error');
		},
		unhighlight : function(element) {
			$(element).closest('.form-control').removeClass('error').addClass(
					'success');
		},
		errorPlacement : function(error, element) {
			$(element).closest('.form-group').append(error);
		}
	});

	paymentFormReady = function() {
		if ($form.find('[name=cardNumber]').hasClass("success")
				&& $form.find('[name=expMonth]').hasClass("success")
				&& $form.find('[name=expYear]').hasClass("success")
				&& $form.find('[name=cvCode]').val().length > 1) {
			return true;
		} else {
			return false;
		}
	}

	$form.find('[type=submit]').prop('disabled', true);
	var readyInterval = setInterval(function() {
		if (paymentFormReady()) {
			$form.find('[type=submit]').prop('disabled', false);
			clearInterval(readyInterval);
		}
	}, 250);
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">


	<%@include file="menu.jsp"%>

	<hr>
	
	<center>
			<div class="container">
				<br>
				<div class="row">
					<div class="col-xs-12 col-md-4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Payment Details</h3>

								<br> <img class="panel-heading"
									src="http://i76.imgup.net/accepted_c22e0.png"> <br>
								<h3 class="panel-title">Total Amount:
									<c:out value="${bookingAmount}"></c:out></h3>
							</div>
							<div class="panel-body">
								<form role="form" action="paymentConfirmation" id="payment-form" method="post">
									<input type = "hidden" value = "${property.getPropertyId()}" name = "propertySearchId"/>
									<input type="hidden" name = "bookingAmount" value="${bookingAmount}"/>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<br> <label for="cardNumber">CARD NUMBER</label><br>
												<input style="height: 30px" maxlength="16" type="text"
													class="form-control" name="cardNumber"
													placeholder="Valid Card Number" required autofocus
													data-stripe="number" /> <span class="input-group-addon"><i
													class="fa fa-credit-card"></i></span>

											</div>
										</div>
									</div>

									<br> <br>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-xs-7 col-md-7">
														<div class="form-group">
															<label for="expMonth">EXPIRATION DATE</label>
															<div class="col-xs-6 col-lg-6 pl-ziro">
														
																<input style="height: 50px; width: 60px;" type="text"
																	class="form-control" name="expMonth" maxlength="2"
																	placeholder="MM" required data-stripe="exp_month" /> <input
																	style="height: 50px; width: 60px;" maxlength="2"
																	type="text" class="form-control" name="expYear"
																	placeholder="YY" required data-stripe="exp_year" />

															</div>
														</div>
														<br>
														<div class="col-xs-7 col-lg-7 pl-ziro">
															<div style="padding-left: 270px" class="form-group">
																<label for="cvCode">CCV CODE</label> <br>
																<input style="height: 50px; width: 70px;"
																	type="password" class="form-control" name="cvCode"
																	placeholder="CV" required data-stripe="cvc" />
															</div>
														</div>
													</div>

													<div>
														<br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input style="padding-right: 10px;" id="bigbutton"
															value="Pay" type="submit" />
													</div>
													<div class="row" style="display: none;">
														<div class="col-xs-12">
															<p class="payment-errors"></p>
														</div>
													</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</center>
	
	
	
			<!-- ./container -->
	
	
	<hr>


	<%@include file="footer.jsp"%>

</body>
</html>
<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>