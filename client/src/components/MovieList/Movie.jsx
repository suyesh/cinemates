import React from "react";
import styled from "styled-components";
import Img from "react-image";

const MovieListMovie = styled.div`
  font-weight: bold;
  text-transform: uppercase;
  position: relative;
  background-image: url(${props => props.image});
  background-repeat: no-repeat;
  background-size: cover;
  cursor: pointer;
  & > img {
    min-height: 100%;
    width: 100%;
  }
`;

const Movie = ({ movie }) => (
  <MovieListMovie image={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}>
    <img
      alt={movie.originalTitle}
      src={`http://image.tmdb.org/t/p/w300${movie.posterImage}`}
    />
  </MovieListMovie>
);

export default Movie;
