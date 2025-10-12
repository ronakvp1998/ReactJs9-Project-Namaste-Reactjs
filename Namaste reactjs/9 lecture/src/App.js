import React from "react";
import ReactDOM from "react-dom/client";
import Header, { Title } from "./components/Header";
import Body from "./components/Body";
import Footer from "./components/Footer";
import { createBrowserRouter, RouterProvider, Outlet } from "react-router-dom";
import About from "./components/About";
import Contact from "./components/Contact";
import Error from "./components/Error";
import RestaurantMenu from "./components/RestaurantMenu";

const AppLayout = () => {
  return (
    <>
      <Header />
      {/* // Outlet is a placeholder for the nested routes */}
      <Outlet />
      <Footer />
    </>
  );
};

const appRouter = createBrowserRouter([
  {
    path: "/",
    // what need to get loaded for / path
    element: <AppLayout />,
    errorElement: <Error />,
    // make a nested route for all other path
    children: [
      {
        path: "/",
        // what need to get loaded for /about path
        element: <Body />,
      },
      {
        path: "/about",
        // what need to get loaded for /about path
        element: <About />,
      },
      {
        path: "/contact",
        // what need to get loaded for /about path
        element: <Contact />,
      },
      {
        path: "/restaurant/:id",
        // what need to get loaded for /about path
        element: <RestaurantMenu />,
      },
    ],
  },
]);

const root = ReactDOM.createRoot(document.getElementById("root"));
// passing a react Router to the RouterProvider for rendering
// render accordingly to the configurations provided in the appRouter
root.render(<RouterProvider router={appRouter} />);
