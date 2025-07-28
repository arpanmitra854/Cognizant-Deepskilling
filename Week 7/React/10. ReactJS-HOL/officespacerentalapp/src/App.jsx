import React from "react";
import "./App.css";
import officeImg from "./office.jpg"; // Save your image in src folder with name office.jpg

function App() {
  const element = "Office Space";

  const offices = [
    { Name: "DBS", Rent: 50000, Address: "Chennai" },
    { Name: "Regus", Rent: 75000, Address: "Bangalore" },
    { Name: "Innov8", Rent: 45000, Address: "Mumbai" },
    { Name: "WeWork", Rent: 85000, Address: "Delhi" }
  ];

  return (
    <div className="App">
      <h1>{element}, at Affordable Range</h1>
      {offices.map((item, index) => {
        const rentClass = item.Rent <= 60000 ? "textRed" : "textGreen";
        return (
          <div key={index}>
            <img src={officeImg} width="25%" height="25%" alt="Office Space" />
            <h1>Name: {item.Name}</h1>
            <h3 className={rentClass}>Rent: Rs. {item.Rent}</h3>
            <h3>Address: {item.Address}</h3>
            <hr />
          </div>
        );
      })}
    </div>
  );
}

export default App;
