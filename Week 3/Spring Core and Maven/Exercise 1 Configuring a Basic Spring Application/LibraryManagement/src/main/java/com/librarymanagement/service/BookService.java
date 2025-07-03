package com.librarymanagement.service;

import com.librarymanagement.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void addBook(String title) {
        bookRepository.saveBook(title);
        System.out.println("Book added: " + title);
    }
}
