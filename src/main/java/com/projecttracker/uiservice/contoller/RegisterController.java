package com.projecttracker.uiservice.contoller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.projecttracker.uiservice.models.User;

@Controller
public class RegisterController {

	private RestTemplate restTemplate;
	
		private static Logger logger = LoggerFactory.getLogger(RegisterController.class);
		
//		@InitBinder
//		   protected void initBinder(WebDataBinder binder) {
//			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//			binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//			binder.setValidator(userValidator);
//		   }
		
		@RequestMapping(method = RequestMethod.GET, value ="/register")
		public ModelAndView register(User user) {
			ModelAndView mv = new ModelAndView("register");
			Map<String,String> countriesMap = new HashMap<>();
			restTemplate.getForObject("http://user-service/countries", Map.class, countriesMap);
			mv.addObject("user",user);
			mv.addObject("countries", countriesMap);
			return mv;
		}
		
		@RequestMapping(method = RequestMethod.POST, value ="/register")
		public ModelAndView register(HttpServletRequest request, @Valid User user,BindingResult result) {
			ModelAndView mv = new ModelAndView("redirect:registration-confirmation");
			if (result.hasErrors()) {
				mv = new ModelAndView("register");
				Map<String,String> countriesMap = new HashMap<>();
				restTemplate.getForObject("http://user-service/countries", Map.class, countriesMap);
				mv.addObject("user",user);
				mv.addObject("countries", countriesMap);
				return mv;
			}
			restTemplate.postForEntity("http://user-service/users", user, User.class);
			logger.info("User: " + user.getUsername());
			return mv;
		}
		
		@RequestMapping(method = RequestMethod.GET, value ="/registration-confirmation")
		public ModelAndView registrationConfirmation(User user) {
			ModelAndView mv = new ModelAndView("registration-confirmation");
			return mv;
		}
		
		@ExceptionHandler(value = Exception.class)
	    public String handleError(HttpServletRequest req, Exception exception) {
	        logger.error("Request: " + req.getRequestURL() + " raised " + exception);
	        exception.printStackTrace();
	        return "errors/error";
		}
	}