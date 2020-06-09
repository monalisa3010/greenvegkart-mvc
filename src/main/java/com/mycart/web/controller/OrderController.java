package com.mycart.web.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.function.Function;
import java.util.function.ToDoubleFunction;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mycart.web.model.UserDetails;
import com.mycart.web.model.vo.CheckoutItem;
import com.mycart.web.model.vo.CreateOrderRequest;
import com.mycart.web.model.vo.CreateOrderResponse;
import com.mycart.web.model.vo.Order;
import com.mycart.web.model.vo.OrderItem;
import com.mycart.web.model.vo.OrderRequest;

@Controller
public class OrderController {

	private RestTemplate restTemplate = new RestTemplate();

	@ResponseBody
	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public CreateOrderResponse registerUser(@RequestBody OrderRequest orderRequest, HttpSession httpSession) {

		Function<CheckoutItem, OrderItem> mapper = new Function<CheckoutItem, OrderItem>() {

			@Override
			public OrderItem apply(CheckoutItem t) {
				OrderItem orderItem = new OrderItem();
				orderItem.setProductId(t.getId());
				orderItem.setQuantity(t.getQuantity());
				return orderItem;
			}

		};
		ToDoubleFunction<CheckoutItem> sumMapper = new ToDoubleFunction<CheckoutItem>() {

			@Override
			public double applyAsDouble(CheckoutItem checkoutItem) {
				// TODO Auto-generated method stub
				return checkoutItem.getQuantity() * checkoutItem.getPrice();
			}
		};
		Double totalAmount = orderRequest.getOrderItems().stream().collect(Collectors.summingDouble(sumMapper));

		List<OrderItem> orderItems = orderRequest.getOrderItems().stream().map(mapper).collect(Collectors.toList());
		CreateOrderRequest createOrderRequest = new CreateOrderRequest();
		createOrderRequest.setOrderItems(orderItems);
		createOrderRequest.setDeliveryAddressId(orderRequest.getAddressid());
		createOrderRequest.setTotalAmount(new BigDecimal(totalAmount));
		createOrderRequest.setPaymentType(orderRequest.getPayment().getType());
		createOrderRequest.setCustomerId(((UserDetails) httpSession.getAttribute("userDetails")).getUserId());

		CreateOrderResponse createOrderResponse = restTemplate.postForObject(
				"http://localhost:8093/api/order/createorder", createOrderRequest, CreateOrderResponse.class);

		return createOrderResponse;
	}

	@RequestMapping(value = "/order/{orderId}", method = RequestMethod.GET)
	public ModelAndView fetchOrderDetails(@PathVariable("orderId") String orderId,HttpSession httpSession) {
		Order order = restTemplate.getForObject("http://localhost:8093/api/order/orderdetails/" + orderId, Order.class);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("confirmOrder");
		modelAndView.addObject("order", order);
		httpSession.removeAttribute("basketItem");
		return modelAndView;
	}

}
