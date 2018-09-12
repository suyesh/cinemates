import React from "react";
import { MdThumbUp, MdThumbDown } from "react-icons/md";
import { MovieToolBarDiv, LikeUnlikeButton } from "../Movie/styles";

const MovieLike = ({ show, movie }) => {
  if (show) {
    return (
      <MovieToolBarDiv>
        <LikeUnlikeButton>
          <MdThumbUp color="#05c46b" size="1.8em" />
        </LikeUnlikeButton>
        <LikeUnlikeButton>
          <MdThumbDown color="#ff3f34" size="1.8em" />
        </LikeUnlikeButton>
      </MovieToolBarDiv>
    );
  }
  return null;
};

export default MovieLike;
