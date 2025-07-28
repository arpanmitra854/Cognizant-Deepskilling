import GuestGreeting from './GuestGreeting';
import UserGreeting from './UserGreeting';

export default function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  return isLoggedIn ? <UserGreeting /> : <GuestGreeting />;
}
