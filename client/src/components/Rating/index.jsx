import React from "react";
import styled from "styled-components";
import CircularProgressbar from "react-circular-progressbar";
import "react-circular-progressbar/dist/styles.css";

const RatingDiv = styled.div`
  width: 2.5em;
  height: 2.5em;
  position: absolute;
  top: 0.625em;
  left: 0.625em;
`;

const averageVoteColor = vote => {
  if (vote >= 7.5) {
    return "#27ae60";
  } else if (vote >= 5.5) {
    return "#e67e22";
  } else {
    return "#c0392b";
  }
};

const Rating = ({ averageVote }) => {
  return (
    <RatingDiv>
      <CircularProgressbar
        percentage={(averageVote / 10) * 100}
        text={`${averageVote.toFixed(1)}`}
        background
        styles={{
          background: {
            fill: "#2d3436"
          },
          text: {
            fill: "#ecf0f1",
            fontSize: "1.875em"
          },
          path: {
            stroke: averageVoteColor(averageVote)
          },
          trail: { stroke: "transparent" }
        }}
      />
    </RatingDiv>
  );
};

export default Rating;
