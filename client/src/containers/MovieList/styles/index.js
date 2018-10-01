import styled from "styled-components";

const MovieListMovies = styled.div`
  display: grid;
  grid-gap: 0.1em;
  grid-template-columns: repeat(auto-fill, minmax(185px, 1fr));
  grid-auto-rows: minmax(300px, auto);
  grid-auto-flow: dense;
  -webkit-transition: width 5s linear 1s;
  transition: width 2s linear 1s;
  background-color: #1b1c1d !important;
  border: none !important;
  padding: 0 !important;
`;

export { MovieListMovies };
