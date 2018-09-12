export const averageVoteColor = vote => {
  if (vote >= 7.5) {
    return "#27ae60";
  } else if (vote >= 5.5) {
    return "#e67e22";
  } else {
    return "#c0392b";
  }
};

export const voteColorStyles = {
  background: {
    fill: "#2d3436"
  },
  text: {
    fill: "#ecf0f1",
    fontSize: "1.875em"
  },
  trail: { stroke: "transparent" }
};
