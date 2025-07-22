import './App.css';
import CalculateScore from "./CalculateScore.js";

function App() {
  return (
    <div>
      <CalculateScore Name="Arpan" School="UEM Kolkata" total={95.4} goal={100} />
    </div>
  );
}

export default App;