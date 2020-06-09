package com.mycart.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mycart.web.model.Category;
import com.mycart.web.model.Product;
import com.mycart.web.model.vo.Basket;

@Controller
public class ProductController {

	private RestTemplate restTemplate = new RestTemplate();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView fetchProducts(HttpSession session) {
		Product[] responseTypeList = restTemplate.getForObject("http://localhost:8093/api/product/getallproducts",
				Product[].class);
		List<Product> products = Arrays.asList(responseTypeList);
		HashMap<Category, List<Product>> productsByCategoryMap = new HashMap<Category, List<Product>>();
		List<Product> pList = new ArrayList<>();
		for (Product product : products) {
			Category category = product.getCategory();
			if (!productsByCategoryMap.containsKey(product.getCategory())) {
				pList = new ArrayList<Product>();
				if (pList.size() <= 4) {
					pList.add(product);
					productsByCategoryMap.put(category, pList);
				}
			} else {
				if (productsByCategoryMap.get(category).size() < 4) {
					productsByCategoryMap.get(category).add(product);
				}
			}
		}
		List<Category> categoryList = Arrays.asList(
				restTemplate.getForObject("http://localhost:8093/api/product/getallcategories", Category[].class));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		// modelAndView.addObject("products", products);
		// modelAndView.addObject("categoryList", categoryList);
		session.setAttribute("categoryList", categoryList);
		session.setAttribute("productsByCategoryMap", productsByCategoryMap);
		// modelAndView.addObject("productsByCategoryMap", productsByCategoryMap);
		return modelAndView;
	}

	@RequestMapping(value = "/getProducts/category", method = RequestMethod.GET)
	public ModelAndView fetchProductsByCategoryId(@RequestParam("cat_id") String id, HttpSession session) {
		System.out.println("Id: " + id);
		List<Product> products = Arrays
				.asList(restTemplate.getForObject("http://localhost:8093/api/product/category/" + id, Product[].class));
		System.out.println(products);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", products.get(0).getCategory());
		modelAndView.addObject("products", products);
		modelAndView.setViewName("product-by-category");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/postCheckoutItemsToSession", method = RequestMethod.POST)
	public boolean registerUser(@RequestBody Basket basket, HttpSession httpSession) {

		System.out.println(basket);

		httpSession.setAttribute("basketItem", basket);

		return true;
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkout(HttpSession httpSession) {
//		String itemsJson = "[{\"id\":1,\"name\":\"Brocolli\",\"summary\":\"summary 1\",\"price\":120,\"quantity\":2,\"image\":\"/mykart-web/static/GreenKart - veg and fruits kart_files/broccoli.jpg\"},{\"id\":3,\"name\":\"Cucumber\",\"summary\":\"summary 1\",\"price\":50.5,\"quantity\":1,\"image\":\"/mykart-web/static/GreenKart - veg and fruits kart_files/cucumber.jpg\"},{\"id\":4,\"name\":\"Beetroot\",\"summary\":\"summary 1\",\"price\":80,\"quantity\":1,\"image\":\"/mykart-web/static/GreenKart - veg and fruits kart_files/beetroot.jpg\"},{\"id\":2,\"name\":\"Cauliflower\",\"summary\":\"summary 1\",\"price\":30,\"quantity\":1,\"image\":\"/mykart-web/static/GreenKart - veg and fruits kart_files/cauliflower.jpg\"}]";
//		List<CheckoutItem> checkOutItems = new ArrayList<>();
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			checkOutItems = Arrays.asList(mapper.readValue(itemsJson, CheckoutItem[].class));
//		} catch (JsonParseException e) {
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
		Basket basket = ((Basket) httpSession.getAttribute("basketItem"));

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("manage-checkout");
		modelAndView.addObject("checkOutItems", basket.getCheckOutItems());
		return modelAndView;
	}
}
