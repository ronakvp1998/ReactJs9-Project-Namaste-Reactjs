import { useState } from "react";
import { restaurantList } from "../constants";
import RestrauntCard from "./RestrauntCard";

// Function to filter restaurants based on search text
function filterData(searchText, restaurants) {
  return restaurants.filter((restaurant) =>
    restaurant.info.name.toLowerCase().includes(searchText.toLowerCase())
  );
}

const Body = () => {
  const [restaurants, setRestaurants] = useState(restaurantList);
  const [searchText, setSearchInput] = useState("");

  return (
    <>
      <div className="search-container">
        <input
          type="text"
          className="search-input"
          placeholder="Search"
          value={searchText}
          onChange={(e) => {
            setSearchInput(e.target.value);
          }}
        />
        <button
          className="search-btn"
          onClick={() => {
            // Filter the data
            const data = filterData(searchText, restaurantList);
            // Update the state
            setRestaurants(data);
          }}
        >
          Search
        </button>
      </div>
      <div className="restaurant-list">
        {restaurants.length > 0 ? (
          restaurants.map((restaurant) => (
            <RestrauntCard {...restaurant.info} key={restaurant.info.id} />
          ))
        ) : (
          <p>No restaurants found</p>
        )}
      </div>
    </>
  );
};
export default Body;
