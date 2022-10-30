package com.chris.bookclub.repositories;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.chris.bookclub.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
    
    

}

