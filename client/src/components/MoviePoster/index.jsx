import React, { Component } from "react";
import Img from "react-image";
import Rating from "../Rating";
import { MovieListMovie } from "./styles";

class MoviePoster extends Component {
  render() {
    const { movie } = this.props;
    return (
      <MovieListMovie>
        <Rating averageVote={movie.averageVote} />
        <Img src={`http://image.tmdb.org/t/p/w300${movie.posterImage}`} />
      </MovieListMovie>
    );
  }
}

export default MoviePoster;
