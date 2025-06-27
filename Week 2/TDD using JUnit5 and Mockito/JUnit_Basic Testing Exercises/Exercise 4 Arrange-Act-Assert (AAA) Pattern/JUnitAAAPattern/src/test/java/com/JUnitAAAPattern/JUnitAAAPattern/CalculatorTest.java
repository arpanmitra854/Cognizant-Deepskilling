package com.JUnitAAAPattern.JUnitAAAPattern;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

	private Calculator calculator;

	@Before
	public void setUp() {
		// runs BEFORE every @Test
		calculator = new Calculator();
		System.out.println("Before - setup done");
	}

	@After
	public void tearDown() {
		// runs AFTER every @Test
		calculator = null;
		System.out.println("After - teardown done");
	}

	@Test
	public void testAdd() {
		// Arrange
		int a = 2;
		int b = 3;

		// Act
		int result = calculator.add(a, b);

		// Assert
		assertEquals(5, result);
	}

	@Test
	public void testAddNegative() {
		// Arrange
		int a = -4;
		int b = -6;

		// Act
		int result = calculator.add(a, b);

		// Assert
		assertEquals(-10, result);
	}
}

