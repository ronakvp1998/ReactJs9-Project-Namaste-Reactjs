import RestaurantCard from "./RestaurantCard";
import reslist from "../utils/mockdata";
import { useEffect, useState } from "react";
import Shimmer from "./Shimmer";
const Body = () => {
  const reslist1 =
    reslist.data?.cards[4]?.card.card?.gridElements?.infoWithStyle.restaurants;

  const [listOfRestaurants, setListOfRestaurants] = useState([]);
  const [searchText, setSearchText] = useState("");
  const [filteredRestaurants, setFilteredRestaurants] = useState([]);

  console.log("Body rendered");

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

  useEffect(() => {
    const timer = setTimeout(() => {
      setListOfRestaurants(reslist1);
      setFilteredRestaurants(reslist1);
    }, 1500); // 2-second delay
    console.log("useEffect called");
    return () => clearTimeout(timer); // cleanup
  }, []);

  return listOfRestaurants.length === 0 ? (
    <Shimmer />
  ) : (
    <div className="body">
      <div className="filter">
        <div className="Search">
          <input
            type="text"
            className="search-box"
            placeholder="Search"
            value={searchText}
            onChange={(e) => {
              setSearchText(e.target.value);
            }}
          ></input>

          <button
            onClick={() => {
              const filteredList = reslist1.filter((res) =>
                res.info.name.toLowerCase().includes(searchText.toLowerCase())
              );
              setFilteredRestaurants(filteredList);
            }}
          >
            Search
          </button>
        </div>
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
        {filteredRestaurants.map((restaurant, index) => (
          <RestaurantCard
            key={restaurant?.info?.id || index}
            resName={restaurant?.info?.name}
            cusines={restaurant?.info?.cuisines.join(", ")}
            imageId={restaurant?.info?.cloudinaryImageId}
            avgRating={restaurant?.info?.avgRating}
            costForTwo={restaurant?.info?.costForTwo}
            deliveryTime={restaurant?.info?.sla?.slaString}
          />
        ))}
      </div>
    </div>
  );
};

export default Body;
