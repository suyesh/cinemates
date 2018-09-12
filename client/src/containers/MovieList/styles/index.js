import styled from "styled-components";

const MovieListDiv = styled.div`
  display: grid;
  grid-gap: 0.3em;
  grid-template-columns: repeat(auto-fill, minmax(185px, 1fr));
  grid-auto-rows: minmax(300px, auto);
  grid-auto-flow: dense;
  -webkit-transition: width 5s linear 1s;
  transition: width 2s linear 1s;
`;

export { MovieListDiv };
