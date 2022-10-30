package com.chris.bookclub.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chris.bookclub.models.Book;
import com.chris.bookclub.repositories.BookRepository;
    
@Service
public class BookService {
    
    @Autowired
    private BookRepository bookRepo;
    
    public List<Book> findAllBooks(){
    	return (List<Book>) bookRepo.findAll();
    }
    
    public Book saveBook(Book b) {
		return bookRepo.save(b);
    }
    
    public Book findById(Long id) {
    	return bookRepo.findById(id).get();
    }
    
    public void deleteBook(Book b) {
    	bookRepo.delete(b);
    }
    
    public Book updateBook(Book b) {
    	return bookRepo.save(b);
    }
    
}