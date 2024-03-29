import gql from "graphql-tag";

const ALL_MOVIES = gql`
  query GetAllMovies(
    $page: Int!
    $nowPlaying: Boolean
    $upcoming: Boolean
    $topRated: Boolean
    $lowRated: Boolean
    $adult: Boolean
    $popular: Boolean
  ) {
    allMovies(
      page: $page
      nowPlaying: $nowPlaying
      upcoming: $upcoming
      topRated: $topRated
      lowRated: $lowRated
      adult: $adult
      popular: $popular
    ) {
      total
      currentPage
      pages
      list {
        id
        title
        posterImage
        averageVote
      }
    }
  }
`;

export { ALL_MOVIES };
