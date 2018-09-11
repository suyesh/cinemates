export const CHANGE_PAGE_NUMBER = "CHANGE_PAGE_NUMBER";
export const TOGGLE_TOP_RATED = "TOGGLE_TOP_RATED";
export const TOGGLE_LOW_RATED = "TOGGLE_LOW_RATED";
export const TOGGLE_UPCOMING = "TOGGLE_UPCOMING";
export const TOGGLE_NOW_PLAYING = "TOGGLE_NOW_PLAYING";
export const TOGGLE_ADULT = "TOGGLE_ADULT";

export const changePageNumber = pageNumber => ({
  type: CHANGE_PAGE_NUMBER,
  payload: pageNumber
});

export const topRated = () => ({
  type: TOGGLE_TOP_RATED
});

export const lowRated = () => ({
  type: TOGGLE_LOW_RATED
});

export const upcoming = () => ({
  type: TOGGLE_UPCOMING
});

export const nowPlaying = () => ({
  type: TOGGLE_NOW_PLAYING
});

export const adult = () => ({
  type: TOGGLE_ADULT
});
