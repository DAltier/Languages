package com.codingdojo.danaaltier.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.danaaltier.languages.models.Language;
import com.codingdojo.danaaltier.languages.services.LanguageService;


@Controller
public class LanguageController {
	
	private final LanguageService languageService;
    
    
    public LanguageController(LanguageService languageService) {
        this.languageService = languageService;
    }
    
    
    // Methods
 	// GET route for all languages
 	@RequestMapping("/languages")
 	// Model used for instantiating and binding to our view model
 	public String index(Model model,  @ModelAttribute("language") Language lang) {
 		List<Language> languages = languageService.allLanguages();
 		model.addAttribute("languages", languages);
 		return "index.jsp";
 	}
    
    
 	// POST route for creating a new language
 	@PostMapping("/languages")
 	// @Valid checks for validation
 	// @BindingResult after, checks for errors
 	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
 		if(result.hasErrors()) {
 			List<Language> languages = languageService.allLanguages();
 			model.addAttribute("languages", languages);
 			return "index.jsp";
 		}else {
 			languageService.createLanguage(language);
 			return "redirect:/languages";
 		}
 	}
    
    
 	// GET route for show id
  	@RequestMapping("/languages/{id}")
  	// @Path for query and Model for binding view
  	public String show(@PathVariable("id") Long id, Model model) {
  		Language language = languageService.findLanguage(id);
  		model.addAttribute("language", language);
  		return "show.jsp";
  	}
    
    // GET route for update
    @RequestMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Language language = languageService.findLanguage(id);
        model.addAttribute("language", language);
        return "edit.jsp";
    }
    
    // PUT route for update
    @RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            languageService.updateLanguage(language);
            return "redirect:/languages";
        }
    }
    
    
    // DELETE Route by id
  	@RequestMapping("/languages/delete/{id}")
  	public String destory(@PathVariable("id") Long id) {
  		// Queries and deletes language from PathVariable
  		languageService.deleteLanguage(id);
  		return "redirect:/languages";
  	}
}
