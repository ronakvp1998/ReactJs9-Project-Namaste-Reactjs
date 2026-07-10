import { ERROR_IMG } from "../utils/constants.js";

const ItemList = ({ items }) => {
  return (
    <div className="p-4">
      {items.map((item) => (
        <div key={item.id} className="p-2 m-2 border-gray-200 border-b-2">
          <div className="flex justify-between">
            <div>
              <span className="py-2"> {item.name} </span>
              <span> {item.price + " ₹"} </span>
              <p className="text-sm">descritpion</p>
            </div>
            <div >
                <div  className="absolute">
                   <button className="p-1 mx-16 bg-black shadow-lg rounded-lg text-sm text-white">Add+</button>
                </div>
                <img src={ERROR_IMG} alt={item.name} className="w-20"></img>
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};

export default ItemList;
