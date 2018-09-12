import React from "react";
import CircularProgressbar from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";

import { RatingDiv } from "./styles";
import { averageVoteColor, voteColorStyles } from "../../utils";

const Rating = ({ averageVote }) => {
  return (
    <RatingDiv>
      <CircularProgressbar
        percentage={(averageVote / 10) * 100}
        text={`${averageVote.toFixed(1)}`}
        background
        styles={{
          ...voteColorStyles,
          path: {
            stroke: averageVoteColor(averageVote)
          }
        }}
      />
    </RatingDiv>
  );
};

export default Rating;
