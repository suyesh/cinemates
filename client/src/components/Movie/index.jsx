import React from "react";
import styled from "styled-components";
import Rating from "../Rating";

const MovieListMovie = styled.div`
  font-weight: bold;
  text-transform: uppercase;
  position: relative;
  background-image: url(${props => props.image});
  background-repeat: no-repeat;
  background-size: cover;
  cursor: pointer;
  position: relative;
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
    <Rating averageVote={movie.averageVote} />
  </MovieListMovie>
);

export default Movie;
