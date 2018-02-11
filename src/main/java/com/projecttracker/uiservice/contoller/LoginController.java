package com.projecttracker.uiservice.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.projecttracker.uiservice.models.User;


@Controller
public class LoginController {
	
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	
	
	@RequestMapping(method = RequestMethod.GET, value ="/login")
	public ModelAndView login(@ModelAttribute User user) {
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("user", user);
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.POST, value ="/login")
	public ModelAndView loggedIn(HttpServletRequest request, @ModelAttribute @Valid User user,BindingResult result) {
		ModelAndView mv = new ModelAndView("login");
		String username = user.getUsername();
		String password = user.getPassword();
		if (result.hasErrors()) {
				return mv;
			}
		else {
//				user = loginService.checkCredentials(username, password);
				if (user == null) {
					result.reject("login.failed");
//					loginService.loginFailed(username);
					return mv;
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("username", user);
//					if (sessionService.createSession(username) > 0) {
					mv = new ModelAndView("redirect:dashboard");
					mv.addObject("user",user);
					return mv;
					}
//					else {
//						result.reject("session.failed");
//						return mv;
					}
				}
//		}
//	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/forgot-password")
	public ModelAndView forgotPassword() {
		ModelAndView mv = new ModelAndView("forgot-password");
		return mv;
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:login");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("username");
		session.invalidate();
//		sessionService.closeSession(user.getUsername());
		return mv;
	}
	
	@ExceptionHandler(value = Exception.class)
    public String handleError(HttpServletRequest req, Exception exception) {
        logger.error("Request: " + req.getRequestURL() + " raised " + exception);
        exception.printStackTrace();
        return "errors/error";
	}
}
