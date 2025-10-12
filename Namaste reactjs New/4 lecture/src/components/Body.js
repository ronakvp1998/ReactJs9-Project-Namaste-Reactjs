import RestaurantCard from "./RestaurantCard";
import reslist from "../utils/mockdata";
import { useEffect, useState } from "react";
const Body = () => {
  const reslist1 =
    reslist.data?.cards[4]?.card.card?.gridElements?.infoWithStyle.restaurants;

  const [listOfRestaurants, setListOfRestaurants] = useState(reslist1);
  // const [listOfRestaurants, setListOfRestaurants] = useState([]);
  // useEffect(() => {
  //   fetchData();
  // }, []);

  // const fetchData = async () => {
  //   const data = await fetch(
  //     "https://corsproxy.io/?url=https://example.comhttps://www.swiggy.com/dapi/restaurants/list/v5?lat=19.2644981&lng=72.9652491&is-seo-homepage-enabled=true&page_type=DESKTOP_WEB_LISTING"
  //   );

  //   const json = await data.json();
  //   console.log(json);
  //   setListOfRestaurants(
  //     json?.data?.cards[4]?.card.card?.gridElements?.infoWithStyle.restaurants
  //   );
  // };
  // if (listOfRestaurants.length === 0) {
  //   return <h1>Loading...</h1>;
  // }

  return (
    <div className="body">
      <div className="filter">
        <button
          className="filter-btn"
          onClick={() => {
            const filteredList = reslist1.filter(
              (res) => res.info.avgRating > 4.3
            );
            setListOfRestaurants(filteredList);
          }}
        >
          Top Rated Restaurant
        </button>
      </div>
      <div className="res-container">
        {listOfRestaurants.map((restaurant, index) => (
          <RestaurantCard
            key={restaurant?.info?.id || index}
            resName={restaurant?.info?.name}
            cusines={restaurant?.info?.cuisines.join(", ")}
            imageId={restaurant?.info?.cloudinaryImageId}
            avgRating={restaurant?.info?.avgRating}
          />
        ))}
      </div>
    </div>
  );
};

export default Body;
