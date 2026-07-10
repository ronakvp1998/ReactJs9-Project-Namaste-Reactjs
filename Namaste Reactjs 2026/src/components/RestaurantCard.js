import { IMG_URL } from "../utils/constants.js";


const RestaurantCard = ({ resData }) => {
  return (
    <div className="m-4 p-4 w-[250px] h-[400px] rounded-lg  bg-gray-50 shadow-lg hover:bg-gray-200" >
      <h2 className="p-2 font-bold justify-center">{resData?.name}</h2>
      <img
        className="rounded-lg w-[250px] h-[250px]"
        src={IMG_URL + resData?.cloudinaryImageId}
        onError={(e) => {
          // If the Swiggy image fails, load a generic food placeholder
          e.target.src = IMG_URL + "qn0mtexltvqs637zjgdx"        }}
      ></img>
      <h4 className="p-2"> {resData?.avgRating}</h4>
      <h4 className="p-2">{resData?.costForTwo}</h4>
    </div>
  );
};

// Higher Order Component


// input - RestaurantCard => RestaurantCardPromoted

export const withPromotedLabel = (RestaurantCard) => {
  return (resData) => {
    return(
      <div>
        <label className="absolute bg-black text-white m-1 p-1 rounded-lg">Promoted</label>
        <RestaurantCard resData={resData}/>
      </div>
    )
  }
}

export default RestaurantCard;
