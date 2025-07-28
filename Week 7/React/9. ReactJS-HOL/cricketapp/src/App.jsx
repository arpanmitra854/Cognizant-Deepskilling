import React from 'react';
import ListofPlayers from './components/ListofPlayers';
import Scorebelow70 from './components/Scorebelow70';
import { OddPlayers } from './components/OddPlayers';
import { EvenPlayers } from './components/EvenPlayers';
import ListofIndianPlayers from './components/ListofIndianPlayers';

function App() {
  const flag = true;

  const players = [
    { name: 'Rohit', score: 50 },
    { name: 'Virat', score: 90 },
    { name: 'Dhoni', score: 45 },
    { name: 'Hardik', score: 70 },
    { name: 'Raina', score: 66 },
    { name: 'Rahul', score: 88 },
    { name: 'Shreyas', score: 95 },
    { name: 'Jadeja', score: 60 },
    { name: 'Bumrah', score: 72 },
    { name: 'Ashwin', score: 67 },
    { name: 'Shami', score: 40 }
  ];

  const T20Players = ['First Player', 'Second Player', 'Third Player'];
  const RanjiTrophyPlayers = ['Fourth Player', 'Fifth Player', 'Sixth Player'];
  const IndianPlayers = [...T20Players, ...RanjiTrophyPlayers];

  return flag ? (
    <div>
      <h1>List of Players</h1>
      <ListofPlayers players={players} />
      <hr />
      <h1>List of Players having Scores Less than 70</h1>
      <Scorebelow70 players={players} />
    </div>
  ) : (
    <div>
      <div>
        <h1>Indian Team</h1>
        <h1>Odd Players</h1>
        <OddPlayers {...[IndianPlayers]} />
        <hr />
        <h1>Even Players</h1>
        <EvenPlayers {...[IndianPlayers]} />
      </div>
      <hr />
      <div>
        <h1>List of Indian Players Merged:</h1>
        <ListofIndianPlayers IndianPlayers={IndianPlayers} />
      </div>
    </div>
  );
}

export default App;
