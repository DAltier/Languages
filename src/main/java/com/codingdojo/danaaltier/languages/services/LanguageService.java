package com.codingdojo.danaaltier.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.danaaltier.languages.models.Language;
import com.codingdojo.danaaltier.languages.repositories.LanguageRepository;


@Service
public class LanguageService {
	
	// adding the language repository as a dependency
	private final LanguageRepository languageRepository;
 
	
	public LanguageService(LanguageRepository languageRepository) {
	    this.languageRepository = languageRepository;
	}
	 
	 
	// returns all the languages
	public List<Language> allLanguages() {
	    return languageRepository.findAll();
	}
	
	
	// creates a language
	public Language createLanguage(Language b) {
	    return languageRepository.save(b);
	}
	
	
	// retrieves a language
	public Language findLanguage(Long id) {
	    Optional<Language> optionalLanguage = languageRepository.findById(id);
	    
	    if(optionalLanguage.isPresent()) {
	        return optionalLanguage.get();
	    } else {
	        return null;
	    }
	}
	
	
	// updates a language
	public Language updateLanguage(Language lang) {
		return updateLanguage(lang.getId(), lang.getName(), lang.getCreator(), lang.getVersion());
	}
	public Language updateLanguage(Long id, String name, String creator, String version) {
    	Optional <Language> temp = languageRepository.findById(id);
    	
    	if(temp != null) {
    		temp.get().setName(name);
    		temp.get().setCreator(creator);
    		temp.get().setVersion(version);
    		return languageRepository.save(temp.get());
    	}
    	
    	return null;        
    }
    
	
    // deletes a language
    public void deleteLanguage(Long id) {
    	languageRepository.deleteById(id);
    }
}
