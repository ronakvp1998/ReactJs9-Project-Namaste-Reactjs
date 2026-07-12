import { LOGO_URL } from "../utils/constants";
import { useState ,useContext} from "react";
import { Link } from "react-router-dom";
import useOnlineStatus from "../utils/useOnlineStatus";
import UserContext from "../utils/UserContext";
import { useSelector } from "react-redux";

const Header = () => {

  // let btnName = "Login";

  const [btnName,setBtnName] = useState("Login");

  const onlineStatus = useOnlineStatus();

  const data = useContext(UserContext);

  // subscribing the store using selector
  const cartItem = useSelector((store) => store.cart.items);

  return (
    <div className="flex justify-between bg-orange-500 shadow-lg">

      <div className="logo-container">
        {/* Always include an alt attribute and self-close the img tag */}
        <img className="p-2 h-20 w-15 rounded-xl" src={LOGO_URL} alt="Food Logo" />
      </div>
      <div className="flex items-center ">
        <ul className="flex pr-4 m-4" >
          <li className="px-4">Online Status : {onlineStatus ? "Online" : "Offline"}</li>
          <li className="px-4"><Link to="/">Home</Link></li>
          <li className="px-4"><Link to="/about">About Us</Link></li>
          <li className="px-4"><Link to="/contact">Contact Us</Link></li>
          <li className="px-4"><Link to="/grocery">Grocery</Link></li>
          <li className="px-4"><Link to="/cart">Cart ({cartItem.length} Items)</Link></li>
          <button className="px-4"
          onClick= {() => {
            console.log("Login button clicked");
            setBtnName(btnName === "Login" ? "Logout" : "Login");
          }}>{btnName}</button>
          <li className="px-4 font-bold">{data.loggedInUser}</li>
        </ul>
      </div>
    </div>
  );
};

export default Header;
