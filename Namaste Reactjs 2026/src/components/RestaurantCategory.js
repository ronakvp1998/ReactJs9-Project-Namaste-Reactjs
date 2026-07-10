import ItemList from "./ItemList.js";
import { useState } from "react";

const RestaurantCategory = ({ category, items,showItems,setShowIndex }) => {

// const [showItem,setShowItem] = useState(null);

const handleClick = () =>{
    setShowIndex();
}

  return (
    <div>
      <div className="w-[800px] mx-auto my-4 bg-gray-50 shadow-lg p-4 rounded-lg">
        <div className="flex justify-between cursor-pointer" onClick={handleClick}>
          <span className="font-bold text-lg">{category} {items.length}</span>
          <span></span>
        </div>
        {showItems && <ItemList items={items} /> }
      </div>
    </div>
  );
};

export default RestaurantCategory;
