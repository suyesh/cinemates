import { combineReducers } from "redux";
import { MovieListReducer } from "../components/MovieList/redux";

const rootReducer = combineReducers({
  movieList: MovieListReducer
});

export default rootReducer;
