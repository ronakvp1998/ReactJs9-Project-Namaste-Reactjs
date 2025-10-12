import { useState } from "react";
// import { LOGO_URL } from "../utils/constants";
const Header = () => {
  let btnName = "Login";
  const [btnNameNew, setBtnName] = useState(btnName);
  return (
    <div className="header">
      <div className="logo-container">
        {/* Always include an alt attribute and self-close the img tag */}
        <img
          className="logo"
          src="https://github.com/ronakvp1998/ReactJs-tutorails-Revision/blob/main/Namaste%20reactjs%20New/5%20lecture/foodlogo.jpg"
          alt="Food Logo"
        />
      </div>
      <div className="nav-items">
        <ul>
          <li>Home</li>
          <li>About Us</li>
          <li>Contact Us</li>
          <li>Cart</li>
          <button
            className="login"
            onClick={() =>
              btnNameNew === "Login"
                ? setBtnName("Logout")
                : setBtnName("Login")
            }
          >
            {btnNameNew}
          </button>
        </ul>
      </div>
    </div>
  );
};

export default Header;
