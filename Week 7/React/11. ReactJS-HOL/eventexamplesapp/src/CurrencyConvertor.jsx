// src/CurrencyConvertor.jsx
import React, { useState } from 'react';

function CurrencyConvertor() {
  const [rupees, setRupees] = useState('');
  const [euro, setEuro] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Simple conversion rate example
    const conversionRate = 0.011; // 1 INR = 0.011 EUR (Example)
    const result = (parseFloat(rupees) * conversionRate).toFixed(2);
    setEuro(result);
  };

  return (
    <div style={{ marginTop: "30px" }}>
      <h2>Currency Convertor (INR to Euro)</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="number"
          value={rupees}
          onChange={(e) => setRupees(e.target.value)}
          placeholder="Enter amount in INR"
          required
        />
        <button type="submit">Convert</button>
      </form>
      {euro && (
        <p>
          € {euro}
        </p>
      )}
    </div>
  );
}

export default CurrencyConvertor;
