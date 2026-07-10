import { LOGO_URL } from "../utils/constants";
import { useState } from "react";
import { Link } from "react-router-dom";
import useOnlineStatus from "../utils/useOnlineStatus";
const Header = () => {

  // let btnName = "Login";

  const [btnName,setBtnName] = useState("Login");

  const onlineStatus = useOnlineStatus();

  return (
    <div className="header">
      <div className="logo-container">
        {/* Always include an alt attribute and self-close the img tag */}
        <img className="logo" src={LOGO_URL} alt="Food Logo" />
      </div>
      <div className="nav-items">
        <ul>
          <li>Online Status : {onlineStatus ? "Online" : "Offline"}</li>
          <li><Link to="/">Home</Link></li>
          <li><Link to="/about">About Us</Link></li>
          <li><Link to="/contact">Contact Us</Link></li>
          <li><Link to="/grocery">Grocery</Link></li>
          <li><Link to="/cart">Cart</Link></li>
          <button className="login-btn"
          onClick= {() => {
            console.log("Login button clicked");
            setBtnName(btnName === "Login" ? "Logout" : "Login");
          }}>{btnName}</button>
        </ul>
      </div>
    </div>
  );
};

export default Header;
