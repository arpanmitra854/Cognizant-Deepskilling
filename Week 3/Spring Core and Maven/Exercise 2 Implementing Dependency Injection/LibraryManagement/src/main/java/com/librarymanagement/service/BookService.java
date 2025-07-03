package com.librarymanagement.service;

import com.librarymanagement.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    // Setter injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void issueBook(String bookName) {
        if (bookRepository != null && bookRepository.exists(bookName)) {
            System.out.println("Book issued: " + bookName);
        } else {
            System.out.println("Book not available.");
        }
    }
}
