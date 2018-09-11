import React from "react";

const Movie = ({ movie }) => (
  <div className="movie-list--movie">
    <img src={`http://image.tmdb.org/t/p/original${movie.posterImage}`} />
  </div>
);

export default Movie;
