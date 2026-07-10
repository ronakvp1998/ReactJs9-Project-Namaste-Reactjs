import React from "react";
import ReactDOM from "react-dom/client"; // ✅ Correct for React 18+
import { data } from "./utils/data.js";
import Header from "./components/Header.js";
import Body from "./components/Body.js";
import { createBrowserRouter, RouterProvider ,Outlet} from "react-router-dom";
// import About from "./components/About.js";
import Contact from "./components/Contact.js";
import Cart from "./components/Cart.js";
import Error from "./components/Error.js";
import RestaurantMenu from "./components/RestaurantMenu.js";
// import Grocery from "./components/Grocery.js";
import { lazy, Suspense } from "react";

const Grocery = lazy( () => import("./components/Grocery.js"  ) );
const About = lazy(() => { return import("./components/About.js");});

const AppLayout = () => {
  return (
    <div className="app">
      <Header />
      <Outlet />
    </div>
  );
};

const appRouter = createBrowserRouter([
  {
    path: "/",
    element: <AppLayout />,
    children: [
      {
        path: "/",
        element: <Body />,
        errorElement: <Error />,
      },
      {
        path: "/about",
        element: (
          <Suspense >
            <About fallback={<div>Loading...</div>} />
          </Suspense>
        ),
        errorElement: <Error />,
      },
      {
        path: "/contact",
        element: <Contact />,
        errorElement: <Error />,
      },
      {
        path: "/grocery",
        element: (
          <Suspense fallback={<div>Loading...</div>}>
           <Grocery />
          </Suspense>
        ),
        errorElement: <Error />,
      },
      {
        path: "/cart",
        element: <Cart />,
        errorElement: <Error />,
      },
      {
        path: "/restaurant/:resId",
        element: <RestaurantMenu />,
        errorElement: <Error />,
      }
    ],

    errorElement: <Error />,
  },
]);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<RouterProvider router={appRouter} />);
