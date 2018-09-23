import styled from "styled-components";

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
  & > img:hover {
    position: relative;
    transform: scale(1.1);
    border: 2px solid black;
    z-index: 1;
  }
`;

export { MovieListMovie };
