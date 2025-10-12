import { IMG_URL } from "../utils/constants";
const RestaurantCard = (props) => {
  const { resName, cusines, imageId, avgRating } = props;
  return (
    <div className="res-card">
      <img className="res-logo" alt="res-logo" src={IMG_URL + imageId}></img>
      <h3>{resName}</h3>
      <h4>{cusines}</h4>
      <h4>{avgRating}</h4>
    </div>
  );
};
export default RestaurantCard;
