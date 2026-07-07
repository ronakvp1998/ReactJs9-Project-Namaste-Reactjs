import { IMG_URL } from "../utils/constants.js";

const style = {
  backgroundColor: "#f0f0f0",
};

const RestaurantCard = ({ resData }) => {
  return (
    <div className="res-card" style={style}>
      <h2>{resData?.name}</h2>
      <img
        className="res-logo"
        src={IMG_URL + resData?.cloudinaryImageId}
        onError={(e) => {
          // If the Swiggy image fails, load a generic food placeholder
          e.target.src =
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=508&h=320&fit=crop";
        }}
      ></img>
      <h4>{resData?.avgRating}</h4>
      <h4>{resData?.costForTwo}</h4>
    </div>
  );
};

export default RestaurantCard;
