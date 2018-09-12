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
`;

const MovieToolBarDiv = styled.div`
  width: 100%;
  position: absolute;
  bottom: 0;
  color: white;
  padding: 0.313em;
  text-transform: capitalize;
  display: flex;
  justify-content: space-around;
  align-items: center;
  & > p {
    padding: 0;
  }
`;

const LikeUnlikeButton = styled.div`
  background-color: #1e272e;
  border-radius: 50%;
  height: 2.813em;
  width: 2.813em;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 0.188em solid #485460;
`;

export { MovieListMovie, MovieToolBarDiv, LikeUnlikeButton };
