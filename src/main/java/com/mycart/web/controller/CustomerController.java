package com.mycart.web.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.mycart.web.model.UserAddress;
import com.mycart.web.model.UserDetails;
import com.mycart.web.model.UserRegistrationRequest;
import com.mycart.web.model.UserRegistrationResponse;
import com.mycart.web.model.vo.LoginRequest;
import com.mycart.web.model.vo.LoginResponse;
import com.mycart.web.model.vo.UpdateAddressRequest;
import com.mycart.web.model.vo.UpdateAddressResponse;
import com.mycart.web.model.vo.UserLoginStatus;
import com.mycart.web.model.vo.UserRegistraionStatus;

@Controller
public class CustomerController {

	private RestTemplate restTemplate = new RestTemplate();

	@ResponseBody
	@RequestMapping(value = "/registerCustomer", method = RequestMethod.POST)
	public UserRegistraionStatus registerUser(@RequestBody UserRegistrationRequest registrationRequest) {

		UserRegistraionStatus registraionStatus = null;

		UserRegistrationResponse userRegistrationResponse;
		try {
			userRegistrationResponse = restTemplate.postForObject("http://localhost:8093/api/customer/registeruser",
					registrationRequest, UserRegistrationResponse.class);

			if (userRegistrationResponse.isSuccess()) {
				registraionStatus = new UserRegistraionStatus("Your account created sucessfully", true);
			} else {
				registraionStatus = new UserRegistraionStatus("Opps !!! Error occured .... please try again", false);
			}
		} catch (RestClientException e) {
			registraionStatus = new UserRegistraionStatus("Opps !!! Error occured .... please try again", false);
		}

		return registraionStatus;
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public UserLoginStatus login(@RequestBody LoginRequest loginRequest, HttpSession httpSession) {

		LoginResponse loginResponse = restTemplate.postForObject("http://localhost:8093/api/customer/login",
				loginRequest, LoginResponse.class);
		UserLoginStatus userLoginStatus = null;
		if (loginResponse.getStatusCode() == 1) {
			httpSession.setAttribute("userDetails", loginResponse.getUserDetails());
			httpSession.setAttribute("userAddressList", loginResponse.getUserDetails().getUserAddressList());
			userLoginStatus = new UserLoginStatus(true, loginResponse.getUserDetails().getFirstName());
		} else {
			userLoginStatus = new UserLoginStatus(false, loginResponse.getMessage());
		}
		return userLoginStatus;
	}

	@RequestMapping(value = "/profile/addAddress", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("userAddress") UserAddress userAddress, HttpServletRequest request, HttpSession session) {
		System.out.println("CustomerController with addAddress called");
		UpdateAddressRequest updateAddressRequest = new UpdateAddressRequest();
		updateAddressRequest.getUserAddressList().add(userAddress);
		updateAddressRequest.setUserId(((UserDetails) session.getAttribute("userDetails")).getUserId());
		UpdateAddressResponse updateAddressResponse = restTemplate.postForObject(
				"http://localhost:8093/api/customer/updateAddress", updateAddressRequest, UpdateAddressResponse.class);
		session.setAttribute("userAddressList", updateAddressResponse.getUserAddresses());
		
		if(null!=request.getHeader("Referer") && request.getHeader("Referer").contains(request.getContextPath()+"/checkout")) {
			return "redirect:/checkout";
		}
				
		return "redirect:/viewProfile";
	}

	@RequestMapping(value = "/profile/updateAddress", method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute("userAddress") UserAddress userAddress, HttpSession session) {
		System.out.println("CustomerController with addAddress called");
		UpdateAddressRequest updateAddressRequest = new UpdateAddressRequest();
		updateAddressRequest.getUserAddressList().add(userAddress);
		int userId = ((UserDetails) session.getAttribute("userDetails")).getUserId();
		// http://localhost:8093/api/customer/8/address/update
		String apiUrl = "http://localhost:8093/api/customer/{userId}/address/update";

		// create headers
		HttpHeaders headers = new HttpHeaders();
		// set `content-type` header
		headers.setContentType(MediaType.APPLICATION_JSON);
		// set `accept` header
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

		HttpEntity<UserAddress> request = new HttpEntity<>(userAddress, headers);
		ResponseEntity<UserAddress[]> response = restTemplate.exchange(apiUrl, HttpMethod.PUT, request,
				UserAddress[].class, userId);
		UserAddress[] userAddressArray = response.getBody();
		List<UserAddress> userAddressList = Arrays.asList(userAddressArray);
		session.setAttribute("userAddressList", userAddressList);
		return "redirect:/viewProfile";
	}

	@RequestMapping(value = "/delete/address/{addressId}", method = RequestMethod.GET)
	public String deleteAddress(@PathVariable("addressId") int addressId, HttpSession session) {
		System.out.println("CustomerController with deleteAddress called");
		int userId = ((UserDetails) session.getAttribute("userDetails")).getUserId();
		// http://localhost:8093/api/customer/{userid}/address/delete/{addressid}
		String apiUrl = "http://localhost:8093/api/customer/" + userId + "/address/delete/" + addressId;
		UserAddress[] userAddressArray = restTemplate.getForObject(apiUrl, UserAddress[].class);
		List<UserAddress> userAddressList = Arrays.asList(userAddressArray);
		session.setAttribute("userAddressList", userAddressList);
		return "redirect:/viewProfile";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("CustomerController with logout called");
		session.removeAttribute("userDetails");
		return "redirect:/";
	}

	@RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
	public String showProfile() {
		System.out.println("CustomerController with showProfile called");
		return "manage-user-profile";
	}

}
