package com.chris.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.chris.bookclub.models.Book;
import com.chris.bookclub.models.LoginUser;
import com.chris.bookclub.models.User;
import com.chris.bookclub.services.BookService;
import com.chris.bookclub.services.UserService;

@Controller
public class HomeController {
    
	@Autowired
	private UserService userServ;
	
	@Autowired
	private BookService bookServ;
    
    
    @GetMapping("/")
    public String index(Model model) {
    
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "loginandregister.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
    	
    	User registeredUser = userServ.register(newUser, result);
        
    	if(result.hasErrors()) {
    		model.addAttribute("newLogin", new LoginUser());
    		return "loginandregister.jsp";
    	}
        
        
    	session.setAttribute("user", registeredUser);
    
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
            
    	User loginUser = userServ.login(newLogin, result);
    	
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "loginandregister.jsp";
        }
            
        
        session.setAttribute("user", loginUser);
    
        return "redirect:/dashboard";
    
    }   
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	if(session.getAttribute("user") == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("books", bookServ.findAllBooks());
    	model.addAttribute("user", session.getAttribute("user"));
    	
    	return "dashboard.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
    @GetMapping("/book/new")
    public String newBook(Model model) {
    	
    	model.addAttribute("book", new Book());
    	return "newBook.jsp";
    }
    
    @PostMapping("/book/create")
    public String createBook(@Valid @ModelAttribute("book") Book book, 
            BindingResult result, Model model, HttpSession session) {
    	
    	if(result.hasErrors()) {
            return "newBook.jsp";
        }
    	
    	if(session.getAttribute("user") == null) {
    		return "redirect:/";
    	}
    	book.setUser((User) session.getAttribute("user"));
    	bookServ.saveBook(book);
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/book/show/{id}")
    public String showBook(@PathVariable("id") Long id, HttpSession session, Model model) {
    	
    	User sessionUser = (User) session.getAttribute("user");
    	Book book = bookServ.findById(id);
    	
    	model.addAttribute("sessionUser", sessionUser);
    	model.addAttribute("book", book);
    	model.addAttribute("bookUser", book.getUser());
    	
    	System.out.println(book.getUser());
    	
    	return "showBook.jsp";
    }
    
    @GetMapping("/book/edit/{id}")
    public String editBook(@PathVariable("id") Long id, Model model) {
    	Book book = bookServ.findById(id);
    	model.addAttribute(book);
    	return "editBook.jsp";
    }
    
    @PostMapping("/book/update/{id}")
    public String updateBook(@Valid @ModelAttribute("book") Book book, 
            BindingResult result, Model model, HttpSession session) {
    	if(result.hasErrors()) {
            return "editBook.jsp";
        }
    	
    	if(session.getAttribute("user") == null) {
    		return "redirect:/";
    	}
    	
    	book.setUser((User) session.getAttribute("user"));
    	bookServ.updateBook(book);
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/book/delete/{id}")
    public String deleteBook(@PathVariable("id") Long id, Model model) {
    	Book book = bookServ.findById(id);
    	bookServ.deleteBook(book);
    	
    	return "redirect:/dashboard";
    }
}
