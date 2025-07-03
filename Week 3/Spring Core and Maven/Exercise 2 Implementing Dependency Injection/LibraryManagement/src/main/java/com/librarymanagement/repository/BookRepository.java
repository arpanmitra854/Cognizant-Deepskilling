package com.librarymanagement.repository;

public class BookRepository {
    public boolean exists(String bookName) {
        // dummy check
        return "Harry Potter".equalsIgnoreCase(bookName);
    }
}
