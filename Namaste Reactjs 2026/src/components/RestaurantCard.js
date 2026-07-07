
import {IMG_URL} from "../utils/constants.js";

const style = {
  backgroundColor: "#f0f0f0",
}

const RestaurantCard = ({resData}) => {
  return(
    <div className="res-card" style={style}>
      <h2>{resData?.name}</h2>
      <img className="res-logo" src={IMG_URL+resData?.cloudinaryImageId}></img>
      <h3>{resData?.cuisines?.join(", ")}</h3>
      <h4>{resData?.avgRating}</h4>
      <h4>{resData?.sla?.deliveryTime + " min"}</h4>
    </div>
  )
}

export default RestaurantCard;