import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { RouterProvider, createBrowserRouter } from 'react-router-dom';
import { About, ErrorPage, Home, SharedLayout, SingleCocktail } from './pages';
import { loader as homeLoader } from './pages/Home.jsx';
import { loader as singleCocktailLoader } from './pages/SingleCocktail.jsx';

const router = createBrowserRouter([
  {
    path: '/',
    element: <SharedLayout />,
    errorElement: <ErrorPage />,
    children: [
      {
        errorElement: <ErrorPage />,
        children: [
          {
            index: true,
            element: <Home />,
            loader: homeLoader
          },
          {
            path: 'about',
            element: <About />
          },
          {
            path: 'cocktail/:id',
            element: <SingleCocktail />,
            loader: singleCocktailLoader
          }
        ]
      }
    ]
  }
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
